/**
 * 织金苗语语音识别系统 - 主要脚本文件
 * 提供通用的交互和动画功能
 */

document.addEventListener('DOMContentLoaded', function() {
    // 初始化页面动画
    initializeAnimations();
    
    // 初始化交互效果
    initializeInteractions();
});

/**
 * 初始化页面动画
 */
function initializeAnimations() {
    // 为所有需要动画的元素添加观察器
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // 观察所有卡片元素
    document.querySelectorAll('.paper-panel, .stat-card, .feature-card').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
        observer.observe(el);
    });
}

/**
 * 初始化交互效果
 */
function initializeInteractions() {
    // 为所有按钮添加涟漪效果
    document.querySelectorAll('.btn').forEach(button => {
        button.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;

            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = x + 'px';
            ripple.style.top = y + 'px';
            ripple.classList.add('ripple');

            this.appendChild(ripple);

            setTimeout(() => ripple.remove(), 600);
        });
    });

    // 为导航链接添加平滑滚动
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (href !== '#') {
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    target.scrollIntoView({ behavior: 'smooth' });
                }
            }
        });
    });

    // 为表单输入添加焦点效果
    document.querySelectorAll('input, textarea, select').forEach(input => {
        input.addEventListener('focus', function() {
            this.style.boxShadow = '0 0 0 3px rgba(25, 50, 77, 0.1)';
        });

        input.addEventListener('blur', function() {
            this.style.boxShadow = 'none';
        });
    });
}

/**
 * 显示加载状态
 * @param {HTMLElement} element - 目标元素
 * @param {boolean} show - 是否显示
 */
function showLoading(element, show = true) {
    if (show) {
        element.style.opacity = '0.6';
        element.style.pointerEvents = 'none';
    } else {
        element.style.opacity = '1';
        element.style.pointerEvents = 'auto';
    }
}

/**
 * 显示提示信息
 * @param {string} message - 提示内容
 * @param {string} type - 类型 ('success', 'error', 'info')
 * @param {number} duration - 显示时长（毫秒）
 */
function showNotification(message, type = 'info', duration = 3000) {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 1rem 1.5rem;
        border-radius: 0.5rem;
        background: ${type === 'success' ? '#10b981' : type === 'error' ? '#ef4444' : '#3b82f6'};
        color: white;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        animation: slideInDown 0.3s ease-out;
        z-index: 1000;
    `;

    document.body.appendChild(notification);

    setTimeout(() => {
        notification.style.animation = 'slideInUp 0.3s ease-out reverse';
        setTimeout(() => notification.remove(), 300);
    }, duration);
}

/**
 * 防抖函数
 * @param {Function} func - 要执行的函数
 * @param {number} wait - 等待时间（毫秒）
 */
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

/**
 * 节流函数
 * @param {Function} func - 要执行的函数
 * @param {number} limit - 限制时间（毫秒）
 */
function throttle(func, limit) {
    let inThrottle;
    return function(...args) {
        if (!inThrottle) {
            func.apply(this, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    };
}

/**
 * 格式化文件大小
 * @param {number} bytes - 字节数
 */
function formatFileSize(bytes) {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
}

/**
 * 格式化时间
 * @param {Date|string} date - 日期对象或字符串
 */
function formatDate(date) {
    if (typeof date === 'string') {
        date = new Date(date);
    }
    
    const now = new Date();
    const diff = now - date;
    const seconds = Math.floor(diff / 1000);
    const minutes = Math.floor(seconds / 60);
    const hours = Math.floor(minutes / 60);
    const days = Math.floor(hours / 24);

    if (seconds < 60) return '刚刚';
    if (minutes < 60) return `${minutes}分钟前`;
    if (hours < 24) return `${hours}小时前`;
    if (days < 7) return `${days}天前`;

    return date.toLocaleDateString('zh-CN');
}

/**
 * API 请求包装器
 * @param {string} url - 请求地址
 * @param {Object} options - 请求选项
 */
async function apiRequest(url, options = {}) {
    const defaultOptions = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    };

    const mergedOptions = { ...defaultOptions, ...options };

    try {
        const response = await fetch(url, mergedOptions);
        const data = await response.json();

        if (!response.ok) {
            throw new Error(data.error || '请求失败');
        }

        return data;
    } catch (error) {
        console.error('API 请求错误:', error);
        throw error;
    }
}

/**
 * 验证文件类型
 * @param {File} file - 文件对象
 * @param {Array<string>} allowedTypes - 允许的 MIME 类型
 */
function validateFileType(file, allowedTypes) {
    return allowedTypes.includes(file.type);
}

/**
 * 验证文件大小
 * @param {File} file - 文件对象
 * @param {number} maxSize - 最大大小（字节）
 */
function validateFileSize(file, maxSize) {
    return file.size <= maxSize;
}

// 导出函数供全局使用
window.showLoading = showLoading;
window.showNotification = showNotification;
window.debounce = debounce;
window.throttle = throttle;
window.formatFileSize = formatFileSize;
window.formatDate = formatDate;
window.apiRequest = apiRequest;
window.validateFileType = validateFileType;
window.validateFileSize = validateFileSize;

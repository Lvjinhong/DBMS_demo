module.exports = {
    devServer: {
        host: '0.0.0.0',
        port: 8080, // 你想要的端口号
        public: 'http://123.249.112.89:8080', // 使用你的公网 IP 地址
        disableHostCheck: true,
        https: false, // 如果你想使用 https，可以设置为 true
        headers: {
            "Access-Control-Allow-Origin": "*",
        }
    }
}

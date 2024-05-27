# TurboCloud: The Lightest and Easiest Way to Deploy Web Projects

TurboCloud is the lightest and easiest way to deploy static websites, web apps, backends, IoT projects, and any other web projects without any vendor lock-in, straight from your local directory. No Git, no wasting time on configuration, no setup - just run one command on your local machine to get your web project online with automatic HTTPS, restarting, low resource usage, and almost zero deployment configuration.

## Advantages

- Zero dependencies - your project will be available until your cloud provider is live
- Daemonless
- TurboCloud itself uses very small resources
- Fully predictable cloud costs
- Zero DevOps knowledge required
- Only one command to deploy from your local machine
- Works with virtually any cloud provider
- No Docker registry required

## How to Deploy Static Websites

#### Notes for Static Websites

- Check the `examples/static-website` directory to see how TurboCloud handles folders
- `index.html` in each folder (including the root folder) will be available at `domain.com` and `domain.com/folder_name`
- Each HTML file is available under two URLs: `/file_name` and `file_name.html`
- We use `https://static-web-server.net/` for images with static websites

curl https://raw.githubusercontent.com/localcloud-dev/turbo-cloud/main/turbocloud | sh -s -- -i 167.235.137.215 -d turbo.localcloud.sh -t type

#### Deployment

1. Order a VPS, cloud server, or dedicated server with a public IP address, fresh Ubuntu 22.04, and SSH access from any cloud provider.
2. Add an A record with the IP address of your new server to your custom domain.
3. In the root folder of your static website project, run the following command:

```
./turbocloud -i ip_address_of_server -d your_domain_without_http_https -t static
```
4. Open the website URL in the browser

## Coming Soon

- Any services and apps with Dockerfile
- Frontend frameworks (Next.js, Vue.js, Svelte, etc.)

## License

MIT
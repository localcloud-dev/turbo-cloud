# TurboCloud: The Lightest and Easiest Way to Deploy Web Projects

TurboCloud is the lightest and easiest way to deploy static websites, web apps, backends, IoT projects, and any other web projects without any vendor lock-in, straight from your local directory. No Git, no wasting time on configuration, no setup - just run one command on your local machine to get your web project online with automatic HTTPS, restarting, low resource usage, and almost zero deployment configuration.

**Don't forget to click on Star if you like the project.**

## Advantages

- Zero dependencies - your project will be available until your cloud provider is live
- Daemonless
- HTTPS for custom domains
- Works with WebSocket services (ws:// and wss://)
- TurboCloud itself uses very small resources
- Fully predictable cloud costs
- Zero DevOps knowledge required
- Only one command to deploy from your local machine
- Works with virtually any cloud provider
- No Docker registry required
- Zero downtime deployments

## How to Deploy Static Websites

#### Notes for Static Websites

- Check the `examples/static-website` directory to see how TurboCloud handles folders
- `index.html` in each folder (including the root folder) will be available at `domain.com` and `domain.com/folder_name`
- Each HTML file is available under two URLs: `domain.com/file_name` and `domain.com/file_name.html`
- We use [Static Web Server](https://static-web-server.net/) for containers with static websites

#### Deployment

1. Order a VPS, cloud server, or dedicated server with a public IP address, fresh Ubuntu 22.04, and SSH access from any cloud provider (see Recommended Cloud Providers section below).
2. Add an A record with the IP address of your new server to your custom domain (DNS A record: your_domain.com or subdomain.your_domain.com -> IP address of a server created at the step 1)
3. In the root folder of your static website project, run the following command (replace ip_address_of_server and your_domain_without_http_https with real values):

```
curl https://raw.githubusercontent.com/localcloud-dev/turbo-cloud/main/turbocloud | sh -s -- -i ip_address_of_server -d your_domain_without_http_https -t static
```

4. Open the website URL in the browser

## Coming Soon

- Any services and apps with Dockerfile
- Frontend frameworks (Next.js, Vue.js, Svelte, etc.)

## Recommended Cloud Providers
- DigitalOcean
- Vultr 
- Scaleway
- OVH
- Other cloud providers where you can sign up and spin up an instance without reading tons of docs

## Cloud Providers to Avoid
We don't recommend using AWS, Google Cloud, or Azure because:
- They're overengineered and way too expensive
- Someone should pay for all their free tiers, startup programs, and marketing costs
- They have way too many infrastructure layers to deal with
- They try to lock you in at every step
- Their support sucks or is non-existent unless you pay for a premium plan
- The learning curve is insane

## Projects used in TurboCloud
- https://github.com/damphat/kv-bash
- https://static-web-server.net/

## License

MIT
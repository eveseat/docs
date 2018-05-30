![SeAT](https://i.imgur.com/aPPOxSK.png)

# Nginx

!!! warning

    This page is still a work in progress and not in its final state. To get you going though, install nginx according for your host OS based on the guides here:
    
The SeAT web interface requires a web server to serve the HTML goodies it has. We highly recommend you to use <code>nginx</code> and will be covered in this document. You don't <strong>have</strong> to use it, so if you prefer something else, feel free.

- [Ubuntu](/guides/installation/manual_installation/ubuntu/#nginx)
- [Debian](/guides/installation/manual_installation/debian/#web-service)


## Installation
<section class="mdc-tabs">
<ul class="mdc-tab-bar">
  <li class="mdc-tab active"><a role="tab" data-toggle="tab">Docker</a></li>
  <li class="mdc-tab"><a role="tab" data-toggle="tab">Ubuntu</a></li>
  <li class="mdc-tab"><a role="tab" data-toggle="tab">CentOS 7</a></li>
  <li class="mdc-tab"><a role="tab" data-toggle="tab">Debian</a></li>
</ul>
<div class="mdc-panels">
<div role="tabpanel" class="mdc-panel active">

<div class="admonition note">
<p class="admonition-title">This section is still WIP if you know nginx you can configure accordingly to the example below</p>
</p>
</div>

   <div class="codehilite"><pre><span></span><span class="nt">server</span> <span class="p">{</span>
       <span class="err">listen</span> <span class="err">80</span><span class="p">;</span>
       <span class="err">charset</span> <span class="err">utf-8</span><span class="p">;</span>
       <span class="err">client_max_body_size</span> <span class="err">128M</span><span class="p">;</span>
       <span class="err">server_name</span> <span class="err">yourdomainhere.com</span><span class="p">;</span>
       <span class="err">location</span> <span class="err">/</span> <span class="err">{</span>
         <span class="err">access_log</span> <span class="err">off</span><span class="p">;</span>
         <span class="err">proxy_pass</span> <span class="n">http</span><span class="p">:</span><span class="o">//</span><span class="mf">127.0.0.1</span><span class="o">:</span><span class="mi">8080</span><span class="p">;</span>
         <span class="err">proxy_redirect</span> <span class="err">off</span><span class="p">;</span>
         <span class="err">proxy_set_header</span> <span class="err">X-Real-IP</span> <span class="err">$remote_addr</span><span class="p">;</span>
         <span class="err">proxy_set_header</span> <span class="err">Host</span> <span class="err">$host</span><span class="p">;</span>
         <span class="err">proxy_set_header</span> <span class="err">X-Forwarded-Proto</span> <span class="err">https</span><span class="p">;</span>
         <span class="err">proxy_set_header</span> <span class="err">X-Forwarded-For</span> <span class="err">$proxy_add_x_forwarded_for</span><span class="p">;</span>
       <span class="p">}</span>
   <span class="err">}</span>
   </pre></div>

</div>
<div role="tabpanel" class="mdc-panel">

<h4>Nginx Install</h4>
<p>Together with an <code>nginx</code> installation we also need to install <code>php-fpm</code> to handle the PHP execution for us. Let's install <code>nginx</code> and <code>php-fpm</code> with:</p>
<div class="codehilite"><pre><span></span>apt-get install nginx php7.1-fpm
</pre></div>


<h4>Nginx Configuration</h4>
<p>With the webserver installed, we need to configure <code>nginx</code> to serve SeAT. For that, a configuration file needs to be created that will tell <code>nginx</code> where to find <code>php-fpm</code> as well as where the assets are for SeAT.</p>
<p>The configuration file will live at <code>/etc/nginx/sites-available/seat</code>. It can be created with the following command:</p>
<div class="codehilite"><pre><span></span>cat &gt; /etc/nginx/sites-available/seat <span class="s">&lt;&lt; EOL</span>
<span class="s">server {</span>

<span class="s">    listen 80;</span>
<span class="s">    listen [::]:80;</span>

<span class="s">    # If you are hosting this instance on a domain, set that</span>
<span class="s">    # name here.</span>
<span class="s">    #server_name  seat.yourdomain.com;</span>

<span class="s">    # SeAT public directory. This is the only directory that</span>
<span class="s">    # should be exposed by the webserver. If one has to expose</span>
<span class="s">    # the parent directory then things like the .env file will</span>
<span class="s">    # be available for anyone to download.</span>
<span class="s">    root /var/www/seat/public;</span>

<span class="s">    index index.php;</span>

<span class="s">    location / {</span>
<span class="s">       try_files \$uri \$uri/ /index.php?\$query_string;</span>
<span class="s">    }</span>

<span class="s">    # PHP-FPM configuration.</span>
<span class="s">    location ~ \.php\$ {</span>
<span class="s">       try_files \$uri /index.php =404;</span>
<span class="s">       fastcgi_pass unix:/run/php/php7.1-fpm.sock;</span>
<span class="s">       fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;</span>
<span class="s">       include fastcgi_params;</span>
<span class="s">    }</span>

<span class="s">    # Even though .htaccess rules mean nothing in the nginx</span>
<span class="s">    # world, prevent those from being downloaded anyways.</span>
<span class="s">    location ~ /\.ht {</span>
<span class="s">       deny all;</span>
<span class="s">    }</span>

<span class="s">    # In case someone messes up, prevent .env files from</span>
<span class="s">    # being downloaded as well.</span>
<span class="s">    location ~ /\.env {</span>
<span class="s">       deny all;</span>
<span class="s">    }</span>
<span class="s">}</span>
<span class="s">EOL</span>
</pre></div>


<p>The configuration file as is at <code>/etc/nginx/sites-available/seat</code> itself won't be loaded by <code>nginx</code> yet. Storing configuration files in a <code>*sites-available*</code> directory is simply a convention used to allow administrators to quickly add &amp; remove sites if needed. To <em>apply</em> the changes made by the new configuration file it needs to be symlinked to a <code>*sites-enabled*</code> directory.</p>
<p>Let's symlink to the new configuration and drop the default one as a hardening exercise at the same time:</p>
<div class="codehilite"><pre><span></span>ln -s /etc/nginx/sites-available/seat /etc/nginx/sites-enabled/seat
rm /etc/nginx/sites-enabled/default
</pre></div>


<p>Finally, reload <code>nginx</code> and <code>php-fpm</code> for the new changes to take affect:</p>
<div class="codehilite"><pre><span></span>systemctl restart nginx.service
systemctl restart php7.1-fpm.service
</pre></div>

</div>
<div role="tabpanel" class="mdc-panel">

<h4 id="nginx-install">Nginx Install<a class="headerlink" href="#nginx-install" title="Permanent link">&para;</a></h4>
<p>Together with an <code>nginx</code> installation we also need to install <code>php-fpm</code> to handle the PHP execution for us. Let's install <code>nginx</code> and <code>php-fpm</code> with:</p>
<div class="codehilite"><pre><span></span>yum install -y nginx php-fpm
</pre></div>


<h4 id="nginx-configuration">Nginx Configuration<a class="headerlink" href="#nginx-configuration" title="Permanent link">&para;</a></h4>
<p>With the webserver installed, we need to configure <code>nginx</code> to serve SeAT. For that, a configuration file needs to be created that will tell <code>nginx</code> where to find <code>php-fpm</code> as well as where the assets are for SeAT.</p>
<p>The configuration file will live at <code>/etc/nginx/nginx.conf</code>. It can be created with the following command:</p>
<div class="codehilite"><pre><span></span>cat &gt; /etc/nginx/nginx.conf <span class="s">&lt;&lt; EOL</span>
<span class="s"># For more information on configuration, see:</span>
<span class="s">#   * Official English Documentation: http://nginx.org/en/docs/</span>
<span class="s">#   * Official Russian Documentation: http://nginx.org/ru/docs/</span>

<span class="s">user nginx;</span>
<span class="s">worker_processes auto;</span>
<span class="s">error_log /var/log/nginx/error.log;</span>
<span class="s">pid /run/nginx.pid;</span>

<span class="s"># Load dynamic modules. See /usr/share/nginx/README.dynamic.</span>
<span class="s">include /usr/share/nginx/modules/*.conf;</span>

<span class="s">events {</span>
<span class="s">    worker_connections 1024;</span>
<span class="s">}</span>

<span class="s">http {</span>
<span class="s">    log_format  main  &#39;\$remote_addr - \$remote_user [\$time_local] &quot;\$request&quot; &#39;</span>
<span class="s">                      &#39;\$status \$body_bytes_sent &quot;\$http_referer&quot; &#39;</span>
<span class="s">                      &#39;&quot;\$http_user_agent&quot; &quot;\$http_x_forwarded_for&quot;&#39;;</span>

<span class="s">    access_log  /var/log/nginx/access.log  main;</span>

<span class="s">    sendfile            on;</span>
<span class="s">    tcp_nopush          on;</span>
<span class="s">    tcp_nodelay         on;</span>
<span class="s">    keepalive_timeout   65;</span>
<span class="s">    types_hash_max_size 2048;</span>

<span class="s">    include             /etc/nginx/mime.types;</span>
<span class="s">    default_type        application/octet-stream;</span>

<span class="s">    # Load modular configuration files from the /etc/nginx/conf.d directory.</span>
<span class="s">    # See http://nginx.org/en/docs/ngx_core_module.html#include</span>
<span class="s">    # for more information.</span>
<span class="s">    include /etc/nginx/conf.d/*.conf;</span>

<span class="s">    server {</span>

<span class="s">        listen 80 default_server;</span>
<span class="s">        listen [::]:80 default_server;</span>

<span class="s">        # If you are hosting this instance on a domain, set that</span>
<span class="s">        # name here.</span>
<span class="s">        #server_name  seat.yourdomain.com;</span>
<span class="s">        server_name _;</span>

<span class="s">        # SeAT public directory. This is the only directory that</span>
<span class="s">        # should be exposed by the webserver. If one has to expose</span>
<span class="s">        # the parent directory then things like the .env file will</span>
<span class="s">        # be available for anyone to download.</span>
<span class="s">        root /var/www/seat/public;</span>

<span class="s">        index index.php;</span>

<span class="s">        location / {</span>
<span class="s">        try_files \$uri \$uri/ /index.php?\$query_string;</span>
<span class="s">        }</span>

<span class="s">        # PHP-FPM configuration.</span>
<span class="s">        location ~ \.php\$ {</span>
<span class="s">        try_files \$uri /index.php =404;</span>
<span class="s">        fastcgi_pass 127.0.0.1:9000;</span>
<span class="s">        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;</span>
<span class="s">        include fastcgi_params;</span>
<span class="s">        }</span>

<span class="s">        # Even though .htaccess rules mean nothing in the nginx</span>
<span class="s">        # world, prevent those from being downloaded anyways.</span>
<span class="s">        location ~ /\.ht {</span>
<span class="s">        deny all;</span>
<span class="s">        }</span>

<span class="s">        # In case someone messes up, prevent .env files from</span>
<span class="s">        # being downloaded as well.</span>
<span class="s">        location ~ /\.env {</span>
<span class="s">        deny all;</span>
<span class="s">        }</span>
<span class="s">    }</span>
<span class="s">}</span>
<span class="s">EOL</span>
</pre></div>


<p>Next, reload <code>nginx</code> and <code>php-fpm</code> for the new changes to take affect:</p>
<div class="codehilite"><pre><span></span>systemctl restart nginx.service
systemctl restart php-fpm.service
</pre></div>

</div>
<div role="tabpanel" class="mdc-panel">

<h4 id="nginx-install">Nginx Install<a class="headerlink" href="#nginx-install" title="Permanent link">&para;</a></h4>
<p>Together with an <code>nginx</code> installation we also need to install <code>php-fpm</code> to handle the PHP execution for us. Let's install <code>nginx</code> and <code>php-fpm</code> with:</p>
<div class="codehilite"><pre><span></span>apt-get install nginx php7.1-fpm
</pre></div>


<h4 id="nginx-configuration">Nginx Configuration<a class="headerlink" href="#nginx-configuration" title="Permanent link">&para;</a></h4>
<p>With the webserver installed, we need to configure <code>nginx</code> to serve SeAT. For that, a configuration file needs to be created that will tell <code>nginx</code> where to find <code>php-fpm</code> as well as where the assets are for SeAT.</p>
<p>The configuration file will live at <code>/etc/nginx/sites-available/seat</code>. It can be created with the following command:</p>
<div class="codehilite"><pre><span></span>cat &gt; /etc/nginx/sites-available/seat <span class="s">&lt;&lt; EOL</span>
<span class="s">server {</span>

<span class="s">    listen 80;</span>
<span class="s">    listen [::]:80;</span>

<span class="s">    # If you are hosting this instance on a domain, set that</span>
<span class="s">    # name here.</span>
<span class="s">    #server_name  seat.yourdomain.com;</span>

<span class="s">    # SeAT public directory. This is the only directory that</span>
<span class="s">    # should be exposed by the webserver. If one has to expose</span>
<span class="s">    # the parent directory then things like the .env file will</span>
<span class="s">    # be available for anyone to download.</span>
<span class="s">    root /var/www/seat/public;</span>

<span class="s">    index index.php;</span>

<span class="s">    location / {</span>
<span class="s">       try_files \$uri \$uri/ /index.php?\$query_string;</span>
<span class="s">    }</span>

<span class="s">    # PHP-FPM configuration.</span>
<span class="s">    location ~ \.php\$ {</span>
<span class="s">       try_files \$uri /index.php =404;</span>
<span class="s">       fastcgi_pass unix:/run/php/php7.1-fpm.sock;</span>
<span class="s">       fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;</span>
<span class="s">       include fastcgi_params;</span>
<span class="s">    }</span>

<span class="s">    # Even though .htaccess rules mean nothing in the nginx</span>
<span class="s">    # world, prevent those from being downloaded anyways.</span>
<span class="s">    location ~ /\.ht {</span>
<span class="s">       deny all;</span>
<span class="s">    }</span>

<span class="s">    # In case someone messes up, prevent .env files from</span>
<span class="s">    # being downloaded as well.</span>
<span class="s">    location ~ /\.env {</span>
<span class="s">       deny all;</span>
<span class="s">    }</span>
<span class="s">}</span>
<span class="s">EOL</span>
</pre></div>


<p>The configuration file as is at <code>/etc/nginx/sites-available/seat</code> itself won't be loaded by <code>nginx</code> yet. Storing configuration files in a <code>*sites-available*</code> directory is simply a convention used to allow administrators to quickly add &amp; remove sites if needed. To <em>apply</em> the changes made by the new configuration file it needs to be symlinked to a <code>*sites-enabled*</code> directory.</p>
<p>Let's symlink to the new configuration and drop the default one as a hardening exercise at the same time:</p>
<div class="codehilite"><pre><span></span>ln -s /etc/nginx/sites-available/seat /etc/nginx/sites-enabled/seat
rm /etc/nginx/sites-enabled/default
</pre></div>


<p>Finally, reload <code>nginx</code> and <code>php-fpm</code> for the new changes to take affect:</p>
<div class="codehilite"><pre><span></span>systemctl restart nginx.service
systemctl restart php7.1-fpm.service
</pre></div>


</div>


---

## Get a SSL certficate

it is 2018 get a SSL certificate with [certbot](https://certbot.eff.org/).




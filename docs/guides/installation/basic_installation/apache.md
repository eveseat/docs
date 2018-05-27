![SeAT](https://i.imgur.com/aPPOxSK.png)

# Apache

!!! info

    This page is still a work in progress and not in its final state. To get you going though, install apache for your host OS according to these guides:

So you decided to use apache as webserver. Please follow one of these guides below for your host system.



<section class="mdc-tabs">
<ul class="mdc-tab-bar">
  <li class="mdc-tab active"><a role="tab" data-toggle="tab">Docker</a></li>
  <li class="mdc-tab"><a role="tab" data-toggle="tab">Ubuntu</a></li>
  <li class="mdc-tab"><a role="tab" data-toggle="tab">CentOS 6</a></li>
  <li class="mdc-tab"><a role="tab" data-toggle="tab">CentOS 7</a></li>
</ul>
<div class="mdc-panels">
<div role="tabpanel" class="mdc-panel active">

    <div class="admonition warning">
    <p class="admonition-title">Warning</p>
    <p>This page is still a work in progress. However for Docker Installations we recommend nginx as webserver</p>
    </div>

</div>
<div role="tabpanel" class="mdc-panel">

<p>The SeAT web interface requires a web server to serve the HTML goodies it has. Apache is an alternative of nginx. You don't <strong>have</strong> to use it, so if you prefer something else, feel free.</p>
<p>Let's install Apache &amp; PHP7.1 mod:</p>
<div class="codehilite"><pre><span></span>sudo apt-get install apache2 libapache2-mod-php7.1
</pre></div>


<p>Duplicate the standard www configuration file:</p>
<div class="codehilite"><pre><span></span>sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/seat.conf
</pre></div>


<p>Next, update the configuration file at <code>/etc/apache2/sites-available/seat.conf</code> with some adequate values :</p>
<div class="codehilite"><pre><span></span>sudo vim /etc/apache2/sites-available/seat.conf
</pre></div>


<table>
<thead>
<tr>
<th>variable</th>
<th>initial value</th>
<th>new value</th>
</tr>
</thead>
<tbody>
<tr>
<td>ServerAdmin</td>
<td>webmaster@localhost</td>
<td>email@yourdomain.com</td>
</tr>
<tr>
<td>DocumentRoot</td>
<td>/var/www/html</td>
<td>/var/www/seat</td>
</tr>
<tr>
<td>ServerName</td>
<td>-</td>
<td>yourdomain.com</td>
</tr>
<tr>
<td>ErrorLog</td>
<td>${APACHE_LOG_DIR}/error.log</td>
<td>${APACHE_LOG_DIR}/seat-error.log</td>
</tr>
<tr>
<td>CustomLog</td>
<td>${APACHE_LOG_DIR}/access.log combined</td>
<td>${APACHE_LOG_DIR}/seat-access.log combined</td>
</tr>
</tbody>
</table>
<p>Since SeAT is running under a different user other than Apache's <code>www-data</code> you might run into some permission issue. Hence using <code>mpm_itk</code> module can let Apache run as seat user to avoid permission problem. You don't <strong>have</strong> to use it</p>
<div class="codehilite"><pre><span></span>sudo apt-get install libapache2-mpm-itk
</pre></div>


<p>then</p>
<div class="codehilite"><pre><span></span>sudo a2enmod mpm_itk
</pre></div>


<p>You should see something like this in console:</p>
<div class="codehilite"><pre><span></span><span class="n">Setting</span> <span class="n">up</span> <span class="n">libapache2</span><span class="o">-</span><span class="n">mpm</span><span class="o">-</span><span class="n">itk</span> <span class="p">(</span><span class="mf">2.4</span><span class="p">.</span><span class="mi">7</span><span class="o">-</span><span class="mi">04</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="p">...</span>
<span class="n">apache2_invoke</span><span class="p">:</span> <span class="n">Enable</span> <span class="k">module</span> <span class="nn">mpm_itk</span>
<span class="n">root@openstackm1</span><span class="p">:</span><span class="err">~</span><span class="p">#</span> <span class="n">a2enmod</span> <span class="n">mpm_itk</span>
<span class="n">Considering</span> <span class="n">dependency</span> <span class="n">mpm_prefork</span> <span class="k">for</span> <span class="n">mpm_itk</span><span class="p">:</span>
<span class="n">Considering</span> <span class="n">conflict</span> <span class="n">mpm_event</span> <span class="k">for</span> <span class="n">mpm_prefork</span><span class="p">:</span>
<span class="n">Considering</span> <span class="n">conflict</span> <span class="n">mpm_worker</span> <span class="k">for</span> <span class="n">mpm_prefork</span><span class="p">:</span>
<span class="k">Module</span> <span class="nn">mpm_prefork</span> <span class="n">already</span> <span class="n">enabled</span>
<span class="k">Module</span> <span class="nn">mpm_itk</span> <span class="n">already</span> <span class="n">enabled</span>
<span class="n">root@Server</span><span class="p">:</span><span class="err">~</span><span class="p">#</span>
</pre></div>


<p>Then modify the configuration file:</p>
<div class="codehilite"><pre><span></span>sudo vim /etc/apache2/sites-available/seat.conf
</pre></div>


<p>and add these lines:</p>
<div class="codehilite"><pre><span></span>&lt;IfModule mpm_itk_module&gt;
        AssignUserId seat seat
&lt;/IfModule&gt;
</pre></div>


<p>Your configuration file should look similar to this:</p>
<div class="codehilite"><pre><span></span>&lt;VirtualHost *:80&gt;
        ServerAdmin email@yourdomain.com
        ServerNAme yourdomain.com
        DocumentRoot /var/www/seat/

        &lt;Directory /var/www/seat/&gt;
                Options Indexes FollowSymLinks
                AllowOverride All
                Require all granted
        &lt;/Directory&gt;

        &lt;IfModule mpm_itk_module&gt;
                AssignUserId seat seat
        &lt;/IfModule&gt;

        ErrorLog <span class="si">${</span><span class="nv">APACHE_LOG_DIR</span><span class="si">}</span>/seat-error.log
        CustomLog <span class="si">${</span><span class="nv">APACHE_LOG_DIR</span><span class="si">}</span>/seat-access.log combined

&lt;/VirtualHost&gt;
</pre></div>


<p>Finally, enable the site &amp; reload services :</p>
<div class="codehilite"><pre><span></span>sudo a2ensite seat.conf
sudo service apache2 reload
</pre></div>
    
</div>
<div role="tabpanel" class="mdc-panel">

<p>In order to get the SeAT fronted running, we need to configure Apache to serve our SeAT installs <code>public/</code> folder. This is the only folder that should be internet facing. That small <code>index.php</code> is the gateway into the application.
The Apache configuration itself will depend on how your server is set up. Generally, virtual hosting is the way to go, and this is what I will be showing here.</p>
<p>If you are not going to use virtual hosting, the easiest to get going will probably to symlink <code>/var/www/seat/public/</code> to <code>/var/www/html/seat</code> and configuring apache to <code>AllowOverride All</code> in the <code>&lt;Directory "/var/www/html"&gt;</code> section. This should have SeAT available at http://your-host-name-or-ip/seat after you restart apache.</p>
<h4>virtual host setup</h4>
<p>Getting the virtual host setup is as simple as creating a new configuration file (I usually call it the <code>sites-domain.conf</code>), and modifying it to match your setup. Everywhere you see <code>seat.local</code> as the hostname in the below examples it needs to be substituted to your actual domain.</p>
<p>Lets prepare some directories. We create the directory <code>/var/www/html/seat.local</code> with:</p>
<div class="codehilite"><pre><span></span>mkdir /var/www/html/seat.local
</pre></div>


<p>Next we symlink the SeAT public directory there with:</p>
<div class="codehilite"><pre><span></span>ln -s /var/www/seat/public /var/www/html/seat.local/seat
</pre></div>


<p>Next, we have to configure Apache itself to know about the directories and stuff SeAT needs. We need to create that <code>sites-domain.conf</code> file I mentioned. This file should live in <code>/etc/httpd/conf.d</code>, so lets change directories there:</p>
<div class="codehilite"><pre><span></span>cd /etc/httpd/conf.d
</pre></div>


<p>Now, create the conf file. In my case, the domain is <code>seat.local</code>, so I will call it <code>seat.local.conf</code>. Add the following contents to that file:</p>
<div class="codehilite"><pre><span></span><span class="nt">&lt;VirtualHost</span> <span class="err">*:80</span><span class="nt">&gt;</span>
    ServerAdmin webmaster@your.domain
    DocumentRoot &quot;/var/www/html/seat.local&quot;
    ServerName seat.local
    ServerAlias www.seat.local
    ErrorLog &quot;logs/seat.local-error_log&quot;
    CustomLog &quot;logs/seat.local-access_log&quot; common
    <span class="nt">&lt;Directory</span> <span class="err">&quot;/var/www/html/seat.local&quot;</span><span class="nt">&gt;</span>
        AllowOverride All
        Order allow,deny
        Allow from all
    <span class="nt">&lt;/Directory&gt;</span>
<span class="nt">&lt;/VirtualHost&gt;</span>
</pre></div>


<p>With our config file created, we need to restart apache to read the new file:</p>
<div class="codehilite"><pre><span></span>apachectl restart
</pre></div>


<p>That should be it from a configuration perspective. We can confirm that everything is configured correctly by running:</p>
<div class="codehilite"><pre><span></span>[root@seat conf.d]# apachectl -t -D DUMP_VHOSTS
httpd: Could not reliably determine the server&#39;s fully qualified domain name, using seat.localdomain for ServerName
VirtualHost configuration:
wildcard NameVirtualHosts and _default_ servers:
*:80                   seat.local (/etc/httpd/conf.d/seat.local.conf:1)
Syntax OK
</pre></div>


<p>Thats it! SeAT should now be available at http://your-domain-or-ip/seat</p>

</div>
<div role="tabpanel" class="mdc-panel">

<p>In order to get the SeAT fronted running, we need to configure Apache to serve our SeAT installs <code>public/</code> folder. This is the only folder that should be internet facing. That small <code>index.php</code> is the gateway into the application.
The Apache configuration itself will depend on how your server is set up. Generally, virtual hosting is the way to go, and this is what I will be showing here.</p>
<p>If you are not going to use virtual hosting, the easiest to get going will probably to symlink <code>/var/www/seat/public/</code> to <code>/var/www/html/seat</code> and configuring apache to <code>AllowOverride All</code> in the <code>&lt;Directory "/var/www/html"&gt;</code> section. This should have SeAT available at http://your-host-name-or-ip/seat after you restart apache.</p>
<h4>virtual host setup</h4>
<p>Getting the virtual host setup is as simple as creating a new configuration file (I usually call it the <code>sites-domain.conf</code>), and modifying it to match your setup. Everywhere you see <code>seat.local</code> as the hostname in the below examples it needs to be substituted to your actual domain.</p>
<p>We symlink the SeAT public directory with:</p>
<div class="codehilite"><pre><span></span>ln -s /var/www/seat/public /var/www/html/seat.local
</pre></div>


<p>Next, we have to configure Apache itself to know about the directories and stuff SeAT needs. We need to create that <code>sites-domain.conf</code> file I mentioned. This file should live in <code>/etc/httpd/conf.d</code>, so lets change directories there:</p>
<div class="codehilite"><pre><span></span>cd /etc/httpd/conf.d
</pre></div>


<p>Now, create the conf file. In my case, the domain is <code>seat.local</code>, so I will call it <code>seat.local.conf</code>. Add the following contents to that file:</p>
<div class="codehilite"><pre><span></span><span class="nt">&lt;VirtualHost</span> <span class="err">*:80</span><span class="nt">&gt;</span>
    ServerAdmin webmaster@your.domain
    DocumentRoot &quot;/var/www/html/seat.local&quot;
    ServerName seat.local
    ServerAlias www.seat.local
    ErrorLog &quot;logs/seat.local-error_log&quot;
    CustomLog &quot;logs/seat.local-access_log&quot; common
    <span class="nt">&lt;Directory</span> <span class="err">&quot;/var/www/html/seat.local&quot;</span><span class="nt">&gt;</span>
        AllowOverride All
        Order allow,deny
        Allow from all
    <span class="nt">&lt;/Directory&gt;</span>
<span class="nt">&lt;/VirtualHost&gt;</span>
</pre></div>


<p>With our config file created, we need to restart apache to read the new file:</p>
<div class="codehilite"><pre><span></span>apachectl restart
</pre></div>


<p>That should be it from a configuration perspective. We can confirm that everything is configured correctly by running:</p>
<p>Thats it! SeAT should now be available at http://your-domain-or-ip/</p>

</div>
</section>


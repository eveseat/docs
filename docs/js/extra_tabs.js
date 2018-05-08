var tabsBlocks = document.querySelectorAll('.mdc-tabs');

Array.prototype.forEach.call(tabsBlocks, function(block, i) {
    var tabs = block.querySelectorAll('.mdc-tab-bar .mdc-tab');
    Array.prototype.forEach.call(tabs, function(tab, j) {
        tab.querySelector('a').addEventListener('click', function() {
            Array.prototype.forEach.call(tabs, function(el, k) {
                el.classList.remove('active');
            });

            this.parentNode.classList.add('active');

            var panels = this.parentNode.parentNode.parentNode.querySelectorAll('.mdc-panel');
            Array.prototype.forEach.call(panels, function(panel, k) {
                panel.classList.remove('active');

                if (j === k)
                    panel.classList.add('active');
            });
        });
    });
});

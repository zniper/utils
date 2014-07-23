from django.conf.urls import patterns, url
from django.core.urlresolvers import reverse
from django.contrib import sitemaps
from django.contrib.sitemaps import FlatPageSitemap, GenericSitemap

from apps.catalogue.models import Category


class StaticViewSitemap(sitemaps.Sitemap):
    priority = 0.5
    changefreq = 'weekly'

    def items(self):
        return ['giftcard',]

    def location(self, item):
        return reverse(item)


sitemaps = {
    'flatpages': FlatPageSitemap(),
    'categories': GenericSitemap({
        'queryset': Category.objects.all(),
        }, priority=0.6),
    'static': StaticViewSitemap,
}


urlpatterns = [
    url(r'^sitemap\.xml$', 'django.contrib.sitemaps.views.sitemap',
                           {'sitemaps': sitemaps},
                           name='django.contrib.sitemaps.views.sitemap'),
]

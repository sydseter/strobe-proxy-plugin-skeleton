package
{
	import flash.display.Sprite;
	import flash.system.Security;
	
	import org.osmf.events.MediaFactoryEvent;
	import org.osmf.media.DefaultMediaFactory;
	import org.osmf.media.MediaElement;
	import org.osmf.media.MediaFactory;
	import org.osmf.media.MediaFactoryItem;
	import org.osmf.media.MediaFactoryItemType;
	import org.osmf.media.MediaResourceBase;
	import org.osmf.media.PluginInfo;
	import org.osmf.media.URLResource;
	
	public class StrobeProxySkeletonPlugin extends Sprite
	{
		private static var ID:String = 'http://drvideo.aptoma.no/StrobeProxySkeletonPlugin.swf';
		private var _pluginInfo:PluginInfo;
		
		
		public function Base64ImageGeneratorPlugin()
		{
			Security.allowDomain('*');
			super();
			var item:MediaFactoryItem = new MediaFactoryItem(
				ID,
				canHandleResourceCallback,
				mediaElementCreationCallback,
				MediaFactoryItemType.PROXY
			);
			var items:Vector.<MediaFactoryItem> = new Vector.<MediaFactoryItem>();
			items.push(item);
			this._pluginInfo = new PluginInfo(items, mediaElementCreationNotificationCallback);
		}
		
		public function get pluginInfo():PluginInfo
		{
			return this._pluginInfo;
		}
		
		private function canHandleResourceCallback(resource:MediaResourceBase):Boolean
		{
			return true;
		}
		
		private function mediaElementCreationCallback():MediaElement
		{
			var mediaElement:MediaElement = new MediaElement();
			return mediaElement;
		}
		
		private function mediaElementCreationNotificationCallback(target:MediaElement):void
		{
		}
	}
}

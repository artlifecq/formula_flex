package com.editor.story.view.roleInfo
{
	import com.editor.cfg.GlobalConfig;
	import com.editor.enum.rEnum;
	import com.editor.manager.StoryManager;
	import com.editor.story.data.vo.StoryActionRoleInfoVO;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	public class RoleInfoPanle extends Sprite
	{
		private const alignType_top_left:int = rEnum.ENUM_START(1);
		private const alignType_top_center:int = rEnum.next;
		private const alignType_top_right:int = rEnum.next;
		private const alignType_center_left:int = rEnum.next;
		private const alignType_center_center:int = rEnum.next;
		private const alignType_center_right:int = rEnum.next;
		private const alignType_bottom_left:int = rEnum.next;
		private const alignType_bottom_center:int = rEnum.next;
		private const alignType_bottom_right:int = rEnum.next;
		
		private var _imgBg:Bitmap;
		private var _imgName:Bitmap;
		private var _imgProfession:Bitmap;
		
		private var _loader:Loader;
		private var _vo:StoryActionRoleInfoVO;
		private var _loadIndex:uint;
		public function RoleInfoPanle(vo:StoryActionRoleInfoVO)
		{
			
			_imgBg = new Bitmap();
			addChild(_imgBg);
			
			_imgName = new Bitmap();
			_imgName.x = 35;
			_imgName.y = 200;
			addChild(_imgName);
			
			_imgProfession = new Bitmap();
			_imgProfession.x = 85;
			_imgProfession.y = 125;
			addChild(_imgProfession);
			
			_vo = vo;
			_loadIndex = 0;
			startLoader(vo.imgBg);
			align();
			
		}
		
		/**
		 * @author 杨剑明	  2015-11-11
		 */
		private function align():void
		{
			var stageW:int = StoryManager.get().uiLayer.stage.stageWidth;
			var stageH:int = StoryManager.get().uiLayer.stage.stageHeight;
			switch(_vo.alignType)
			{
				case alignType_top_left:
					this.x = _vo.offsetX;
					this.y = _vo.offsetY;
					break;
				case alignType_top_center:
					this.x = ( stageW >> 1 ) + _vo.offsetX;
					this.y = _vo.offsetY;
					break;
				case alignType_top_right:
					this.x = stageW - _vo.offsetX;
					this.y = _vo.offsetY;
					break;
				case alignType_center_left:
					this.x = _vo.offsetX;
					this.y = (stageH >> 1) + _vo.offsetY;
					break;
				case alignType_center_center:
					this.x = (stageW >> 1) + _vo.offsetX;
					this.y = (stageH >> 1) + _vo.offsetY;
					break;
				case alignType_center_right:
					this.x = stageW - _vo.offsetX;
					this.y = (stageH >> 1) + _vo.offsetY;
					break;
				case alignType_bottom_left:
					this.x = _vo.offsetX;
					this.y = stageH - _vo.offsetY;
					break;
				case alignType_bottom_center:
					this.x = (stageW >> 1) + _vo.offsetX;
					this.y = stageH - _vo.offsetY;
					break;
				case alignType_bottom_right:
					this.x = stageW - _vo.offsetX;
					this.y = stageH - _vo.offsetY;
					break;
					
			}
		}
		
		/**
		 * @author 杨剑明	  2015-11-11
		 */
		private function startLoader(resPath:String):void
		{
			_loadIndex ++;
			_loader = new Loader();
			var path:String = GlobalConfig.getUIAppStory(resPath).replace(/\\/,"/");
			_loader.load(new URLRequest(path));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadBgCmp);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadError);
		}
		
		protected function loadError(event:IOErrorEvent):void
		{
			
		}
		
		protected function loadBgCmp(event:Event):void
		{
			if(_loadIndex == 1)
			{
				
				_imgBg.bitmapData = Bitmap(event.target.content).bitmapData;
				startLoader(_vo.imgName);
			}
			else if(_loadIndex == 2)
			{
				_imgName.bitmapData = Bitmap(event.target.content).bitmapData;
				startLoader(_vo.imgProfession);
			}
			else
			{
				_imgProfession.bitmapData = Bitmap(event.target.content).bitmapData;
				_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadBgCmp);
				layout();
			}
		}
		
		
		/**
		 * @author 杨剑明	  2015-11-19
		 */
		private function layout():void
		{
			if(_vo.type == 1)
			{
				_imgProfession.y = 80;
				_imgProfession.x = _imgName.x = 32;
				
				_imgName.y = _imgProfession.height + _imgProfession.y;
				
				var totalHeight:int = _imgName.y + _imgName.height + 100;
				_imgBg.height = totalHeight;
			}
		}
	}
}
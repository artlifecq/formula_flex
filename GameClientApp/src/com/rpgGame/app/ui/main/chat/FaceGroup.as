package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.manager.chat.FaceGroupManager;
	import com.rpgGame.app.sender.ChatSender;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.FaceCfgData;
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	
	import flash.utils.setTimeout;
	
	import feathers.controls.TabBar;
	
	import org.mokylin.skin.mainui.chat.FaceGroupSkin;
	
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * 表情容器 
	 * @author Admin
	 * 
	 */	
	public class FaceGroup extends SkinUI
	{
		private var _skin : FaceGroupSkin;
		private var _faceList:Vector.<FaceItem>;
		private var _moodList:Vector.<FaceItem>;
		
		public function FaceGroup()
		{
			_skin = new FaceGroupSkin();
			super(_skin);
			showOrHideFace(true);
		}
		
		public function get tabBar():TabBar
		{
			return _skin.tabBar;
		}
		
		public function show():void
		{
			StarlingLayerManager.hintUILayer.addChild(this);
			setTimeout(addEvent,10);//为了避免点击表情按钮和舞台事件处理冲突
		}
		
		private function addEvent():void
		{
			_skin.tabBar.addEventListener( Event.CHANGE, onPage );
			Starling.current.stage.addEventListener( TouchEvent.TOUCH, onStarlingTouch );
		}
		
		public function removeEvent():void
		{
			_skin.tabBar.removeEventListener( Event.CHANGE, onPage );
			Starling.current.stage.removeEventListener(TouchEvent.TOUCH,onStarlingTouch);
		}
		
		private function onPage( e:Event ):void
		{
			var isFaceTab:Boolean = (_skin.tabBar.selectedIndex < 1);
			showOrHideFace(isFaceTab);
			showOrHideMood(!isFaceTab);
		}
		
		private function onStarlingTouch(event:TouchEvent):void
		{
			var touchs : Vector.<Touch> = event.touches;
			var i :int = 0;
			var len : int = touchs.length;
			var touch:Touch;
			for(;i<len;i++)
			{
				touch = touchs[i];
				if(touch.phase != TouchPhase.BEGAN)
					continue;
				if(touch.target is FaceGroup)
					continue;
				if(tabBar.getChildIndex(touch.target) != -1)
					continue;
				if(touch.target is FaceItem)
				{
					var faceInfo:FaceInfo = (touch.target as FaceItem).faceInfo;
					if(FaceCfgData.isFace(faceInfo))
					{
						FaceGroupManager.instance.touchTargetFun(faceInfo);
					}
					else if(FaceCfgData.isMood(faceInfo))
					{
						ChatSender.broadcastMood(faceInfo.index);
					}
				}
				remove();
			}
		}
		
		private function showOrHideFace(toShow:Boolean):void
		{
			var faces : Array = FaceCfgData.getAllFace();
			faces.sort(FaceCfgData.sortByIndex);
			var len:int = faces.length;
			var faceInfo : FaceInfo;
			var faceItem : FaceItem;
			if(_faceList == null)
			{
				_faceList = new Vector.<FaceItem>();
			}
			var count:int = _faceList.length;
			var i : int = 0;
			for (;i < len ; i ++)
			{
				faceInfo = faces[i];
				if(toShow)
				{
					if(i >= count)
					{
						faceItem = new FaceItem(faceInfo);    
						faceItem.touchGroup = true;
						faceItem.x = (i % 7) * 33 + 4;
						faceItem.y = Math.floor(i / 7) * 33+10;
						_faceList.push(faceItem);
					}
					else
					{
						faceItem = _faceList[i];
					}
					addChild(faceItem);
				}
				else
				{
					if(i < count)
					{
						faceItem = _faceList[i];
						faceItem.removeFromParent();
					}
				}
			}
		}
		
		private function showOrHideMood(toShow:Boolean):void
		{
			var faces : Array = FaceCfgData.getAllMoodInfo();
			faces.sort(FaceCfgData.sortByIndex);
			var len:int = faces.length;
			var faceInfo : FaceInfo;
			var faceItem : FaceItem;
			if(_moodList == null)
			{
				_moodList = new Vector.<FaceItem>();
			}
			var count:int = _moodList.length;
			var i : int = 0;
			for (;i < len ; i ++)
			{
				faceInfo = faces[i];
				if(toShow)
				{
					if(i >= count)
					{
						faceItem = new FaceItem(faceInfo);    
						faceItem.touchGroup = true;
						faceItem.x = (i % 7) * 33 + 4;
						faceItem.y = Math.floor(i / 7) * 33+10;
						_moodList.push(faceItem);
					}
					else
					{
						faceItem = _moodList[i];
					}
					addChild(faceItem);
				}
				else
				{
					if(i < count)
					{
						faceItem = _moodList[i];
						faceItem.removeFromParent();
					}
				}
			}
		}
		
		public function remove():void
		{
			if(parent)
				parent.removeChild(this);
			removeEvent();
		}
	}
}
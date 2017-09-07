package  com.rpgGame.app.ui.main.openActivity
{
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.main.openActivity.comps.IActivityPanel;
	import com.rpgGame.app.ui.main.openActivity.comps.ICampSub;
	import com.rpgGame.app.ui.main.openActivity.sub.GeneralActTypeBtnRender;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.netData.activities.bean.ActivityInfo;
	
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.Panel;
	import feathers.controls.Scroller;
	
	import org.mokylin.skin.app.openActivity.OpenActivityPanleSkin;
	
	import starling.display.DisplayObject;


	
	public class GeneralActivityPanel extends SkinUIPanel implements IActivityPanel
	{
		protected var _mainPanelType:int;
		
		protected var _panelShowType:int;
	
	
		//子面板
		protected var subdic:Dictionary = new Dictionary();

		private var _skin:OpenActivityPanleSkin;
		public function GeneralActivityPanel()
		{
			_skin=new OpenActivityPanleSkin();
			super(_skin);
			
			this.dragAble = true;
		
			var list:List=_skin.listCont;
			list.itemRendererFactory = createMainActivityBtn;
			//list.touchAcross=true;
			list.clipContent = true;
			list.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_NONE;
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=4;
			list.addEventListener(Event.TRIGGERED,onClickItem);
		}
		
		private function onClickItem(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function createMainActivityBtn():GeneralActTypeBtnRender
		{
			// TODO Auto Generated method stub
			return new GeneralActTypeBtnRender();
		}
		
		/**
		 * 刷新面板显示
		 */
		public function updataPanel(tag:int = 0, isreq:Boolean = false):void
		{
			if ( tag != 0 )
				_panelShowType = tag;
			
			if(updateActivities())
			{
				if (_panelShowType==0) 
				{
					_panelShowType=(_skin.listCont.dataProvider.getItemAt(0) as Vector.<ActivityInfo>)[0].childPanelType;
					showActivityPanelByType( _panelShowType );
				}
			}
			
			//			showActivityPanelByKey( _panelShowTag );
			
			
			
//			allStateButtonHandler(_arrTextButton[tag]);
		}
		private function updateActivities():Boolean
		{
			var activityMap:HashMap = Mgr.activityPanelMgr.getTagActivityByMianPanel(_mainPanelType);
			if ( activityMap.values().length == 0 )
			{
				hide();
				return false;
			}
			var arrs:Array=activityMap.keys();
			_skin.uiTitle.styleName=activityMap.getValue(arrs[0])[0].titleUrl;
			arrs.sort(Array.NUMERIC);
			_skin.listCont.dataProvider.removeAll();
			var len:int=arrs.length;
			for (var i:int = 0; i < len; i++) 
			{
				_skin.listCont.dataProvider.addItem(activityMap.getValue(arrs[i]));
			}
			
			return true;
		}
		/**活动刷新  更新内容*/
		public function updateActivtiyInfo():void
		{
			
			if(updateActivities())
			{
				showActivityPanelByType( _panelShowType );
			}
		}
		public function updateBySubkey( panelKey:int ):Boolean
		{
			if ( subdic[panelKey] == null )
				return false;
			
			if ( _panelShowType != panelKey )
				return false;
			
			( subdic[panelKey] as ICampSub ).update();
			return true;
		}
		
		public function getSubPanelByType(type:Class):Panel
		{
			for each(var sub:ICampSub in subdic)
			{
				if(sub is type)
				{
					return sub as Panel;
				}
			}
			return null;
		}
		
		/**
		 * 创建子面板
		 * 新加的活动类型在这里搞
		 * */
		protected function createChildPanel(panelChildType:int):ICampSub
		{
			if ( subdic[panelChildType] != null )
				return subdic[panelChildType];
			
			var subpan:ICampSub;
			switch ( panelChildType )
			{
				default:
					GameLog.add("未知活动子面板" + panelChildType.toString() );
					return null;
			}
			
			subpan.x = subpan.y = 0;
			subdic[panelChildType] = subpan;
			return subpan;
		}
		
	
		
		/**
		 * 
		 * */
		private function showActivityPanelByType(type:int):void
		{
			
			var pan:ICampSub = subdic[_panelShowType] ;
			if (type!=_panelShowType) 
			{
				if (pan) 
				{
					MCUtil.removeSelf(pan as DisplayObject);
					pan=null;
				}
			}
			
			_panelShowType =type;
			if (!pan) 
			{
				pan = createChildPanel(_panelShowType );
			}
			if ( pan != null )
			{
				var activityMap:HashMap = Mgr.activityPanelMgr.getTagActivityByMianPanel(_mainPanelType);
				pan.setData( activityMap.getValue(_panelShowType));
				MCUtil.addChildOnly( _skin.uiRight, (pan as DisplayObject) );
			}
		}
		
		
		public function set mainPanelType(value:int):void
		{
			_mainPanelType = value;
		}
		
		public function get mainPanelType():int
		{
			return _mainPanelType;
		}
		override protected function onHide():void
		{
			super.onHide();
			
			var pan:ICampSub = subdic[_panelShowType] ;
			if ( pan != null )
				MCUtil.removeSelf(pan as DisplayObject);
		}
	}
}
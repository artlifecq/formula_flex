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
	import com.rpgGame.netData.activities.bean.ActivityInfo;
	
	import flash.utils.Dictionary;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.Panel;
	import feathers.controls.Scroller;
	
	import org.mokylin.skin.app.openActivity.OpenActivityPanleSkin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;


	/**
	 *活动通用面板左侧list，右侧内容需继承这个面板 
	 * @author yfl
	 * 
	 */	
	public class GeneralActivityPanel extends BaseActivityMainPanel
	{
		protected var _panelShowType:int;
		//子面板
		protected var subdic:Dictionary = new Dictionary();

		private var _skin:OpenActivityPanleSkin;
		public function GeneralActivityPanel(type:int)
		{
			_skin=new OpenActivityPanleSkin();
			super(type,_skin);
			
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
		//	list.addEventListener(Event.TRIGGERED,onClickItem);
			list.addEventListener( Event.CHANGE, list_changeHandler );
		}
		
		private function list_changeHandler(eve:Event):void
		{
			// TODO Auto Generated method stub
			var item:GeneralActTypeBtnRender=_skin.listCont.selectedItemRender as GeneralActTypeBtnRender;
			showActivityPanelByType(item.subType);
		}
		
		
		
		private function createMainActivityBtn():GeneralActTypeBtnRender
		{
			// TODO Auto Generated method stub
			return new GeneralActTypeBtnRender();
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			if (int(data!=0)) 
			{
				_panelShowType=int(data);
			}
		}
	
		override protected function setData(hash:HashMap):void
		{
			var activityMap:HashMap = hash;
			if ( activityMap.values().length == 0 )
			{
				hide();
				return;
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
			if (_panelShowType==0||arrs.indexOf(_panelShowType)==-1) 
			{
				_panelShowType=arrs[0];
			}
			//showActivityPanelByType( _panelShowType );
			_skin.listCont.selectedIndex=arrs.indexOf(_panelShowType);
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
		override protected function onHide():void
		{
			super.onHide();
			
			var pan:ICampSub = subdic[_panelShowType] ;
			if ( pan != null )
				MCUtil.removeSelf(pan as DisplayObject);
		}
	}
}
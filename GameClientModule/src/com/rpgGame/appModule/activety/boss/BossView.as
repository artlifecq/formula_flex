package com.rpgGame.appModule.activety.boss
{
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.enum.ActivityEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.activety.shijieboss.ShiJieBoss_Skin;
	
	/**
	 *boss标签 
	 * @author dik
	 * 
	 */
	public class BossView extends ViewUI
	{
		private var _skin:ShiJieBoss_Skin;
		private var _activeData:ListCollection;
		private var rewardIcon:Object;
		
		public function BossView()
		{
			_skin=new ShiJieBoss_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.ListItem.itemRendererType=BossItemRender;
			_skin.ListItem.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			
			_activeData=new ListCollection();
			var list:Vector.<ActivetyInfo>=ActivetyDataManager.getActiveList(ActivityEnum.BOSS_ACT);
			for(var i:int=0;i<list.length;i++){
				_activeData.addItem(list[i]);
			}
			_skin.ListItem.dataProvider=_activeData;
			
			rewardIcon=new Vector.<IconCDFace>();
			
			var icon:IconCDFace;
			for(i=1;i<5;i++){
				icon=new IconCDFace(IcoSizeEnum.ICON_48);
				rewardIcon.push(icon);
				icon.x=_skin["icon"+i].x;
				icon.y=_skin["icon"+i].y;
				_skin.container.addChild(icon);
			}
		}
		
		override public function show(data:Object=null):void
		{
			
		}
		
		override public function hide():void
		{
			
		}
	}
}
package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.appModule.role.interfaces.ISubPanel;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.player.bean.OthersInfo;
	
	import org.mokylin.skin.app.beibao.juese_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.TouchEvent;
	
	public class SubRolePanel extends SkinUI implements ISubPanel
	{
		private var _otherInfo:OthersInfo;
		protected var basicView:BasicRoleView;
		protected var avatarView:AvatarView;
		protected var packsView:PacksView;
		protected var attConstrastView:AttContrastView;
		protected var _roleData:HeroData;
		public function SubRolePanel()
		{
			super(new juese_Skin());
			initView();
		}
		
		public function onSubShow():void
		{
			_roleData=MainRoleManager.actorInfo;
			attConstrastView.onHide();
			ItemManager.getBackEquip(initItem);
		}
		
		private function initItem():void
		{
			packsView.show();
			basicView.show(_roleData);
			avatarView.show(_roleData);			
		}
		public function onSubHide():void
		{
			basicView.onHide();
			avatarView.onHide();
			packsView.onHide();
			attConstrastView.onHide();
		}
		private function initView():void
		{
			basicView=new BasicRoleView(_stateSkin as juese_Skin);
			avatarView=new AvatarView(_stateSkin as juese_Skin);
			packsView=new PacksView(_stateSkin as juese_Skin);			
			attConstrastView=new AttContrastView(_stateSkin as juese_Skin);
		}
		override protected function onTouch(e:TouchEvent):void
		{
			super.onTouch(e);
			avatarView.onTouch(e);
		}
		public function showCompareData(data:*):void
		{
			_roleData=data.roleData as HeroData;
			_otherInfo=data.info as OthersInfo;
			packsView.onHide();
			refresh();
			_parentContainer.addChild(this);
			attConstrastView.show(_roleData);
			basicView.show(_roleData);
			avatarView.show(_roleData,_otherInfo.equips);
		}
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			
			if(packsView.onTouchTarget(target)){
				return;
			}
			
			if(avatarView.onTouchTarget(target)){
				return;
			}
		}
	}
}
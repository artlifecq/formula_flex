package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.AttChangeView;
	import com.rpgGame.coreData.enum.AttChangeEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.player.bean.OthersInfo;
	
	import org.mokylin.skin.app.beibao.juese_Skin;
	
	import starling.display.DisplayObject;
	
	public class SubRolePanel extends AttChangeView 
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
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			if(data&&data.roleData&&data.info){
				showCompareData(data);	
				attChangeTypes=[];
			}else{
				attChangeTypes=[AttChangeEnum.EQUIP];
				_roleData=MainRoleManager.actorInfo;
				attConstrastView.onHide();
				ItemManager.getBackEquip(initItem);
			}
		}
		
		private function initItem():void
		{
			packsView.show();
			basicView.show(_roleData);
			avatarView.show(_roleData);			
		}
		
		override  public function hide():void
		{
			super.hide();
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
		private function showCompareData(data:*):void
		{
			_roleData=data.roleData as HeroData;
			_otherInfo=data.info as OthersInfo;
			packsView.onHide();
			refresh();
			attConstrastView.show(_roleData);
			basicView.show(_roleData);
			avatarView.show(_roleData,_otherInfo.equips);
			avatarView.setVipData(_otherInfo.viplevel);
			avatarView.setMarriageRingData(_otherInfo.advanceWedding,_otherInfo.marriageName!=null&&_otherInfo.marriageName!="");
		}
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			
			if(packsView.onTouchTarget(target)){
				return;
			}
		}
	}
}
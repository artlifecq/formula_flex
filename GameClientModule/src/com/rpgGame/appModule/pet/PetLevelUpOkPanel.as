package com.rpgGame.appModule.pet
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.PetAdvanceCfg;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import org.mokylin.skin.app.meiren.Meiren_JinjieOk_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class PetLevelUpOkPanel extends SkinUIPanel
	{
		private var _skin:Meiren_JinjieOk_Skin;
		private var _avateUI:UIAvatar3D;
		private var _attItem:Vector.<MeirenAttItemView>;
		private var _petId:int;
		public function PetLevelUpOkPanel()
		{
			_skin=new Meiren_JinjieOk_Skin();
			super(_skin);
			this.dragAble =false;
			this.model=true;
			MCUtil.removeSelf(_skin.ico_up);
			MCUtil.removeSelf(_skin.num_lv);
			initview();
		}
		
		private function initview():void
		{
			_attItem=new Vector.<MeirenAttItemView>();
			_avateUI=new UIAvatar3D(_skin.roleGrp,2.3);
			var item:MeirenAttItemView;
			var initX:int=650;
			var initY:int=308;
			for(var i:int=0;i<5;i++)
			{
				item=new MeirenAttItemView();
				item.x=initX;
				item.y=initY+i*item.height+3;
				item.visible=false;
				_attItem.push(item);
				_skin.container.addChild(item);
			}
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show();
			_petId=data as int;
			initPanel();
		}
		
		override protected function onHide():void
		{
			super.onHide();
		}
		
		public function initPanel():void
		{
			if(_petId==0) return;
			var info:PetInfo=Mgr.petMgr.getPet(_petId);
			var q_pet:Q_girl_pet=PetCfg.getPet(info.modelId);
			var cfg:Q_girl_advance=PetAdvanceCfg.getPet(info.modelId,info.rank);
			_avateUI.updateBodyWithRes(q_pet.q_panel_show_id);
			_avateUI.transition(RoleStateType.ACTION_SHOW);
			_skin.mc_jieshu.styleName="ui/pet/jieshu/"+info.rank+".png";
			_skin.uiJName.styleName="ui/app/meiren/head_icon/"+q_pet.q_head_word+".png";
			
			var id:int=Mgr.petMgr.getAttId(cfg.q_attid_master);
			_skin.userData.number=FightValueUtil.calFightPowerByAttValue(AttValueConfig.getAttInfoById(id),MainRoleManager.actorInfo.job);
			var attrHash:HashMap=AttValueConfig.getAttrHash(id);
			var keys:Array=attrHash.keys();
			var len:int=keys.length;	
			var type:int;
			var view:int;
			for (var i:int = 0; i < _attItem.length; i++) 
			{
				type=keys[i];
				view=attrHash.getValue(type);
				if(i<len){
					_attItem[i].setDate(type,view);
					_attItem[i].visible=true;
				}else{
					_attItem[i].visible=false;
				}
			}		
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			switch(target)
			{
				case _skin.btnOk:
					this.hide();
					break;
			}
		}
	}
}
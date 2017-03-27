package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.view.icon.BuffIcon;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	
	import feathers.controls.StateSkin;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.head.Head_small;
	
	public class MonsterHeadBase extends SkinUI
	{
		protected var _monsterData:MonsterData;
		protected var tween:TweenLite;

		protected var toY:int=42;

		protected var _monsterCfg:Q_monster;
		
		private var goodBuffs:Vector.<BuffIcon>;
		private var badBuffs:Vector.<BuffIcon>;

		private var startX:int=52;
		private var startY:int=60;
		
		public function MonsterHeadBase(skin:StateSkin=null)
		{
			super(skin);
			goodBuffs=new Vector.<BuffIcon>();
			badBuffs=new Vector.<BuffIcon>();
		}
		
		override public function refresh():void
		{
			var selectedRole:SceneRole=SceneRoleSelectManager.selectedRole;
			_monsterData=SceneRoleSelectManager.selectedRole.data as MonsterData;
			_monsterCfg=MonsterDataManager.getData(_monsterData.modelID);
			updateNormal();
			updateAttInfo();
			updateBuff();
			var toX:int=(_stage.stageWidth-this.width)/2;
			this.x=toX;
			this.y=toY;
			this.alpha=0;
			tween=TweenLite.to(this,0.5,{x:toX,y:toY,alpha:1,onComplete:onTween});
			initEvent();
		}
		
		private function updateBuff():void
		{
			var buffList : Vector.<BuffData>=_monsterData.buffList;
			var num:int=buffList.length;			
			for(var i:int=0;i<num;i++){
				var data:BuffData=buffList[i];
				createIcon(data);
			}
		}
		
		private function isCreate(data:BuffData):Boolean
		{
			var icon:BuffIcon;
			var num:int=goodBuffs.length;
			for(var i:int=0;i<num;i++){
				icon=goodBuffs[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					return true;
				}
			}
			num=badBuffs.length;
			for(i=0;i<num;i++){
				icon=badBuffs[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					return true;
				}
			}
			
			return false;
		}
		
		private function createIcon(data:BuffData):void
		{
			if(data.buffData.q_icon_show==0||isCreate(data)){
				return;
			}
			var icon:BuffIcon=new BuffIcon(IcoSizeEnum.ICON_24);
			icon.buffData=data;
			
			if(data.buffData.q_effect_type==2){//负面
				badBuffs.push(icon);
			}else{
				goodBuffs.push(icon);
			}
			
			var gridW:int=IcoSizeEnum.ICON_24+2;
			startX=52;
			for(var i:int=0;i<goodBuffs.length;i++){//buff
				icon=goodBuffs[i];
				icon.x=startX;
				icon.y=startY;
				this.addChild(icon);
				startX=icon.x+gridW;
			}
			for(i=0;i<badBuffs.length;i++){//debuff
				icon=badBuffs[i];
				icon.x=startX;
				icon.y=startY;
				this.addChild(icon);
				startX=icon.x+gridW;
			}
		}
		
		private  function getKey(id : int) : String
		{
			return FaceTypeEnum.BUFF+"_"+_monsterData.id + "_" + id;
		}
		
		protected function initEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.NOWHP_CHANGE, changeHp);
			EventManager.addEvent(MainPlayerEvent.MAXHP_CHANGE, changeHp);
			
			EventManager.addEvent(BuffEvent.ADD_BUFF, addBuff);
			EventManager.addEvent(BuffEvent.REMOVE_BUFF, removeBuff);
		}
		
		private function addBuff(buffData:BuffData):void
		{
			if(buffData.roleId!=_monsterData.id){
				return;
			}
			createIcon(buffData);
		}
		
		private function removeBuff(data:BuffData):void
		{
			if(data.roleId!=_monsterData.id){
				return;
			}
			if(data.buffData.q_effect_type==2){//负面
				removeForDatas(data,badBuffs);
			}else{
				removeForDatas(data,goodBuffs);
			}
		}
		
		private function removeForDatas(data:BuffData,datas:Vector.<BuffIcon>):void
		{
			var icon:BuffIcon;
			var num:int=datas.length;
			for  (var i:int=0;i<num;i++) 
			{
				icon=datas[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					datas.splice(i,1);
					icon.dispose();
					break;
				}
			}
			num=datas.length;
			var changW:int;
			var gridW:int=IcoSizeEnum.ICON_24+2;
			changW=-1*gridW;
			
			startX=52;
			for(i=0;i<goodBuffs.length;i++){//buff
				icon=goodBuffs[i];
				icon.x=startX;
				icon.y=52;
				this.addChild(icon);
				startX=icon.x+gridW;
			}
			for(i=0;i<badBuffs.length;i++){//debuff
				icon=badBuffs[i];
				icon.x=startX;
				icon.y=52;
				this.addChild(icon);
				startX=icon.x+gridW;
			}
		}
		
		protected function changeHp(data:RoleData):void
		{
			_stateSkin["lbl_num"].text=data.totalStat.hp+"/"+data.totalStat.life;
		}
		
		 override protected function onHide() : void
		{
			 if(tween){
				 tween.kill();
			 }
			 tween=null;
			 
			 EventManager.removeEvent(MainPlayerEvent.NOWHP_CHANGE, changeHp);
			 EventManager.removeEvent(MainPlayerEvent.MAXHP_CHANGE, changeHp);
			 
			 EventManager.removeEvent(BuffEvent.ADD_BUFF, addBuff);
			 EventManager.removeEvent(BuffEvent.REMOVE_BUFF, removeBuff);
			 
			 var icon:BuffIcon;
			 while(goodBuffs.length>0){
				 icon=goodBuffs.pop();
				 icon.dispose();
			 }
			 while(badBuffs.length>0){
				 icon=badBuffs.pop();
				 icon.dispose();
			 }
		}
		
		private function updateNormal():void
		{
			_stateSkin["lbl_name"].text=_monsterData.name + " (" + _monsterCfg.q_level +"级)";
			if(_stateSkin is Head_small){
				return;
			}
			if(_stateSkin["uim_zhandouli"]){
				if(!_monsterCfg.q_fighting){
					_stateSkin["uim_zhandouli"].visible=_stateSkin["zhan_bg"].visible=false;
				}else{
					_stateSkin["uim_zhandouli"].number=int(_monsterCfg.q_fighting);
					_stateSkin["uim_zhandouli"].visible=_stateSkin["zhan_bg"].visible=true;
				}
			}
		}
		
		protected function updateAttInfo():void
		{
			changeHp(_monsterData);
		}
		
		private function onTween():void
		{
			tween.kill();
			tween=null;
		}
		
		public function resize(w : int, h : int) : void 
		{
			this.x=(w-this.width)/2;
			this.y=toY;
		}
	}
}
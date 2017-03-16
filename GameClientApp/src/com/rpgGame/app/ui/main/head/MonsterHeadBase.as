package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	
	import feathers.controls.StateSkin;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	public class MonsterHeadBase extends SkinUI
	{
		protected var _monsterData:MonsterData;
		protected var tween:TweenLite;

		protected var toY:int=42;

		private var _monsterCfg:Q_monster;
		
		public function MonsterHeadBase(skin:StateSkin=null)
		{
			super(skin);
		}
		
		override public function refresh():void
		{
			var selectedRole:SceneRole=SceneRoleSelectManager.selectedRole;
			_monsterData=SceneRoleSelectManager.selectedRole.data as MonsterData;
			_monsterCfg=MonsterDataManager.getData(_monsterData.modelID);
			updateNormal();
			updateAttInfo();
			
			this.x=_stage.mouseX;
			this.y=_stage.mouseY;
			this.alpha=0;
			var toX:int=(_stage.stageWidth-this.width)/2;
			tween=TweenLite.to(this,0.5,{x:toX,y:toY,alpha:1,onComplete:onTween});
			initEvent();
		}
		
		protected function initEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.NOWHP_CHANGE, changeHp);
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
		}
		
		private function updateNormal():void
		{
			_stateSkin["lbl_name"].text=_monsterData.name + " (" + _monsterCfg.q_level +"级)";
			if(_stateSkin["uim_zhandouli"]){
				if(!_monsterData.fightingAmount){
					_stateSkin["uim_zhandouli"].visible=_stateSkin["zhan_bg"].visible=false;
				}else{
					_stateSkin["uim_zhandouli"].number=int(_monsterData.fightingAmount);
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
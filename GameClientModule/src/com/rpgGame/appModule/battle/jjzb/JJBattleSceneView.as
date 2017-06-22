package com.rpgGame.appModule.battle.jjzb
{

	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.ctrl.ControlAutoFightSelectSkill;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.appModule.battle.jjzb.ai.RobotAI;
	import com.rpgGame.appModule.common.RoleModelShow;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.netData.zhengba.bean.ZhengBaBriefInfo;
	import com.rpgGame.netData.zhengba.message.SCChallengeResultMessage;
	
	import flash.utils.setTimeout;
	
	import away3d.events.Event;
	
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.zhanchang.Head_Role_Left;
	import org.mokylin.skin.app.zhanchang.Head__Role_Right;
	import org.mokylin.skin.app.zhanchang.ZhangCheng_Scene;
	import com.game.engine3D.display.InterObject3D;

	public class JJBattleSceneView implements ISubBattleView
	{
		private var _scene:SkinnableContainer;
		private var _skin:ZhangCheng_Scene;
		private var _data:SCChallengeResultMessage;
		
		private var _leftRoleShow:RoleModelShow;
		private var _rightRoleShow:RoleModelShow;
		private var _skill:ControlAutoFightSelectSkill;
		private var _leftHeadIcon:UIAsset;
		private var _rightHeadIcon:UIAsset;
		private var _ai:RobotAI;
		private var eff:Inter3DContainer
		public function JJBattleSceneView(view:SkinnableContainer)
		{
			this._scene=view;
			this._skin=_scene.skin as ZhangCheng_Scene;
			this._skin.btnOver.addEventListener(Event.TRIGGERED,onOver);
			_ai=new RobotAI(_skin,onFightOver,_scene);
			hide();
		}
		private function onFightOver():void
		{
			stopEffect();
			_skin.btnOver.visible=false;
			if (AppManager.isAppInScene(AppConstant.BATTLE_RESULT_PANEL)) 
			{
				return;
			}
			AppManager.showAppNoHide(AppConstant.BATTLE_RESULT_PANEL,[_data.victoryInfo.playerId.EqualTo(MainRoleManager.actorInfo.serverID),_data.rank,_data.awardItemInfos,this],""
			,StarlingLayerManager.topUILayer);
		}
		private function onOver(eve:Event):void
		{
			// TODO Auto Generated method stub
			//hide();
			_ai.stop();
			//var runRef : RunStateReference = (_leftRoleShow.avatar.curRole as SceneRole).stateMachine.getReference(RunStateReference) as RunStateReference;
			//_leftRoleShow.avatar.curRole.stateMachine.transition(RoleStateType.ACTION_RUN,runRef);
		}
		
		public function show():void
		{
			this._scene.visible=true;
		}
		
		public function hide():void
		{
			this._scene.visible=false;
			
			if (_ai.forceOver==false) 
			{
				onFightOver();
				_ai.stop();
			}
			clearData();
		}
		private function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		public function playSuccessEff():void
		{
			
			if (eff==null) 
			{
				eff=new Inter3DContainer();
				this._scene.addChild(eff);
				 eff.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JJZB),-150,-160,0,null,addEft);
			}
			
		}
		private function stopEffect():void
		{
			if (eff) 
			{
				eff.dispose();
				eff=null;
			}
		}
		private function clearData():void
		{
			_ai.clear();
			if (_leftRoleShow) 
			{
				_leftRoleShow.dispose();
				MCUtil.removeSelf(_leftRoleShow);
				_leftRoleShow=null;
			}
			if (_rightRoleShow) 
			{
				_rightRoleShow.dispose();
				MCUtil.removeSelf(_rightRoleShow);
				_rightRoleShow=null;
			}
			_data=null;
			_skill=null;
			stopEffect();
			
		}
		public function setData(data:*):void
		{
			clearData();
			_skin.btnOver.visible=true;
			_data=data as SCChallengeResultMessage;
			//给个随机吧
			var winerIsLeft:Boolean=_data.victoryId.EqualTo(MainRoleManager.actorInfo.serverID);
			var leftData:ZhengBaBriefInfo=_data.failureInfo;
			var rightData:ZhengBaBriefInfo=_data.victoryInfo;
			if (winerIsLeft) 
			{
				leftData=_data.victoryInfo;
				rightData=_data.failureInfo;
			}
			if (_data) 
			{
				_leftRoleShow=new RoleModelShow();
				_leftRoleShow.setData(leftData.playerAppearanceInfo,1);
				_leftRoleShow.x=_skin.uiBuron1.x;
				_leftRoleShow.y=_skin.uiBuron1.y;
				_leftRoleShow.avatar.rotationY=-90;
				this._scene.addChild(_leftRoleShow);
				
				_rightRoleShow=new RoleModelShow();
				_rightRoleShow.setData(rightData.playerAppearanceInfo,1);
				_rightRoleShow.x=_skin.uiBuron2.x;
				_rightRoleShow.y=_skin.uiBuron2.y;
				_rightRoleShow.avatar.rotationY=90;
				this._scene.addChild(_rightRoleShow);
			}
			setLeftHeadData(leftData,_skin.skinLeft.skin as Head_Role_Left);
			setRightHeadData(rightData,_skin.skinRight.skin as Head__Role_Right);
			if (winerIsLeft) 
			{
				setTimeout(_ai.setLeftPlayer,0.5,_leftRoleShow,_rightRoleShow, _data.plaeyrHp_1,_data.playerHp_2, _data.roundNumber,winerIsLeft);
			}
			else
			{
				setTimeout(_ai.setLeftPlayer,0.5,_rightRoleShow,_leftRoleShow,_data.playerHp_2, _data.plaeyrHp_1, _data.roundNumber,winerIsLeft);
			}
			playSuccessEff();
		}
		private function setLeftHeadData(brief:ZhengBaBriefInfo,skin:Head_Role_Left):void
		{
			skin.lbName.text=brief.playerName;
			skin.numZhandouli.label=brief.fightPower+"";
			if (_leftHeadIcon==null) 
			{
				_leftHeadIcon=new UIAsset();
				_leftHeadIcon.x=19;
				_leftHeadIcon.y=-17;
				skin.container.addChild(_leftHeadIcon);
			}
			_leftHeadIcon.styleName=getHeadUrl(brief.playerAppearanceInfo.job);
		}
		private function getHeadUrl(job:int):String
		{
			switch(job)
			{
				case JobEnum.ROLE_1_TYPE:
					return AssetUrl.HEAD_ICON_1;
					break;
				case JobEnum.ROLE_2_TYPE:
					return AssetUrl.HEAD_ICON_2;
					break;
				case JobEnum.ROLE_3_TYPE:
					return AssetUrl.HEAD_ICON_3;
					break;
				case JobEnum.ROLE_4_TYPE:
					return AssetUrl.HEAD_ICON_4;
					break;
			}
			return "";
		}
		private function setRightHeadData(brief:ZhengBaBriefInfo,skin:Head__Role_Right):void
		{
			skin.lbName.text=brief.playerName;
			skin.numZhandouli.label=brief.fightPower+"";
			if (_rightHeadIcon==null) 
			{
				_rightHeadIcon=new UIAsset();
				_rightHeadIcon.x=324;
				_rightHeadIcon.y=-17;
				
				skin.container.addChild(_rightHeadIcon);
			}
			_rightHeadIcon.styleName=getHeadUrl(brief.playerAppearanceInfo.job);
			_rightHeadIcon.scaleX=-1;
		}
	}
}
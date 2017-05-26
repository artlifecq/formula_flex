package game.rpgGame.login.view
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.utils.DisplayUtil;
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.alert.AlertPanel;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.TextInput;
	import feathers.core.ToggleGroup;
	import feathers.themes.GuiTheme;
	import feathers.themes.GuiThemeStyle;
	
	import game.rpgGame.login.ClientConfig;
	import game.rpgGame.login.data.AvatarInfo;
	import game.rpgGame.login.data.CreateRoleData;
	import game.rpgGame.login.data.JobType;
	import game.rpgGame.login.data.RoleData;
	import game.rpgGame.login.display3D.InterAvatar3D;
	import game.rpgGame.login.state.RoleStateType;
	import game.rpgGame.login.util.RandomNick;
	
	import gs.TweenLite;
	import gs.easing.Bounce;
	
	import org.mokylin.skin.loginui.create_input_Skin;
	import org.mokylin.skin.loginui.create_role_Skin;
	import org.mokylin.skin.loginui.button.ButtonSkin_shaizi;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 *创建角色 
	 * @author dik
	 * 
	 */
	public class CreateRolePanel extends Inter3DContainer
	{
		private var _skin:create_role_Skin;
		private var _createRoleData:CreateRoleData;
		
		private var _avatar : InterAvatar3D;
		private var _avatarData : RoleData;
		
		//兵家男
		private var job_info_0:AvatarInfo;
		//医家女
		private var job_info_1:AvatarInfo;
		//墨家男女
		private var job_info_2:AvatarInfo;
		private var job_info_3:AvatarInfo;
		
		private var toCreate:Function;
		private var _stage : Stage;
		
		private var sexGroup:ToggleGroup;
		private var jobGroup:ToggleGroup;
		private var jobDesList:Vector.<SkinnableContainer>;
		private var jobDes:SkinnableContainer;
		
		private var bgEft:Inter3DContainer;
		
		private var avatarInfos:Array;
		private var jobTyps:Array;

		private var testJob:feathers.controls.TextInput;

		
		private var gameTimer:GameTimer;
		private const TIME_OUT:int=30*1000;
		private var endTime:int=0;
		private var sexGroupInitX:int=0;
		public function CreateRolePanel(parent:DisplayObjectContainer,onCreateCharFunc:Function)
		{
			parent.addChild(this);
			_skin=new create_role_Skin();
			_skin.toSprite(this);
			toCreate=onCreateCharFunc;
			//不晓得为啥textinput设置不了，皮肤不起效果
//			_skin.text_input.textAlign="center";
			_skin.text_input.fontSize=16;
//			_skin.text_input.color=0xcfc6ae;
			
			sexGroupInitX=_skin.grp_sex.x;
			sexGroup=new ToggleGroup();
			sexGroup.addItem(_skin.btn_man);
			sexGroup.addItem(_skin.btn_woman);
			sexGroup.selectedIndex=0;
			
			jobGroup=new ToggleGroup();
			jobGroup.addItem(_skin.btn_bingjia);
			jobGroup.addItem(_skin.btn_yijia);
			jobGroup.addItem(_skin.btn_mojia);
			jobGroup.selectedIndex=0;
			
			jobDesList=new Vector.<SkinnableContainer>();
			jobDesList.push(_skin.cont_binjia);
			jobDesList.push(_skin.cont_yijia);
			jobDesList.push(_skin.cont_mojia);
			for(var i:int=0;i<3;i++){
				jobDesList[i].visible=false;
			}
			jobDes=_skin.cont_mojia;
			
			initAvatar();
			
			
			_stage = Starling.current.nativeStage;
			var tx:int=_skin.grp_sex.x+_skin.grp_sex.width;
			var ty:int=_skin.grp_sex.y+_skin.grp_sex.height/2;
			
			_skin.grp_sex.pivotX=_skin.grp_sex.width;
			_skin.grp_sex.pivotY=_skin.grp_sex.height/2;
			
			_skin.grp_sex.x=tx;
			_skin.grp_sex.y=ty;
			
			jobGroup.selectedIndex=int(Math.random()*3);
			//墨家在随机男女
			if (jobGroup.selectedIndex==2) 
			{
				sexGroup.selectedIndex=int(Math.random()*2);
			}
			initEvent();
			onStageResize();
			onRandomName();
		
//			testCreateRole();
			//testModelUI();
			gameTimer=new GameTimer("CreateRolePanel",1000,0,onTimer);
			gameTimer.start();
			jobChangeHandler();
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:int=(endTime-getTimer())/1000;
			if (left>0) 
			{
				_skin.labTime.text=left+"秒后进入游戏"
			}
			else
			{
				gameTimer.stop();
				autoSend2Create();
			}
		}
	
		

		private function initEvent():void
		{
			_stage.addEventListener(flash.events.Event.RESIZE, onStageResize);
			sexGroup.addEventListener(away3d.events.Event.CHANGE, updateAvatar );
			jobGroup.addEventListener(away3d.events.Event.CHANGE, jobChangeHandler );
			
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);
		}
		
		
		private function onTouch(e : TouchEvent) : void
		{
			var t : Touch = e.getTouch(this, TouchPhase.ENDED);
			if (t != null && t.target != null)
			{
				if (t.target ==_skin.btn_random)
				{
					toRandom();
					
				}else if(t.target==_skin.btn_create)
				{
					_createRoleData=new CreateRoleData();
					var sexIndex:int;
					if(jobGroup.selectedIndex==0)
					{
						sexIndex=0;
					}else if(jobGroup.selectedIndex==1)
					{
						sexIndex=1;
					}else
					{
						sexIndex=sexGroup.selectedIndex;
					}
					
					_createRoleData.nickName=_skin.text_input.text ;
					_createRoleData.sex=sexIndex+1;
					_createRoleData.job=jobTyps[jobGroup.selectedIndex][sexIndex];
					toCreate(_createRoleData);
					_skin.btn_create.touchable=false;
				}else if(t.target==_skin.roleZone){
					_avatar.role.stateMachine.transition(RoleStateType.ACTION_SHOW);
				}
			}
		}
		private function autoSend2Create():void
		{
			_createRoleData=new CreateRoleData();
			var sexIndex:int;
			if(jobGroup.selectedIndex==0){
				sexIndex=0;
			}else if(jobGroup.selectedIndex==1){
				sexIndex=1;
			}else{
				sexIndex=sexGroup.selectedIndex;
			}
			
			_createRoleData.nickName=_skin.text_input.text ;
			_createRoleData.sex=sexIndex+1;
			_createRoleData.job=jobTyps[jobGroup.selectedIndex][sexIndex];
			toCreate(_createRoleData);
			_skin.btn_create.touchable=false;
		}
		private function resetTime():void
		{
			endTime=getTimer()+TIME_OUT;
			onTimer();
			if (!gameTimer.running) 
			{
				gameTimer.start();
			}
		}
		private var lastTime:int;
		public function toRandom():void
		{
			if (getTimer()-lastTime<100) 
			{
				return;
			}
			lastTime=getTimer();
			onRandomName();
			resetTime();
		}
		public function resetBtn():void
		{
			_skin.btn_create.touchable=true;
		}
		private function onRandomName():void
		{
			_skin.text_input.text = RandomNick.randomNick(sexGroup.selectedIndex==0);			
		}
	
		private function jobChangeHandler(e:away3d.events.Event=null):void
		{
			if(jobGroup.selectedIndex==0){
				_skin.btn_woman.touchable=false;
			}else if(jobGroup.selectedIndex==1){
				_skin.btn_man.touchable=false;
			}else{
				_skin.btn_man.touchable=true;
				_skin.btn_woman.touchable=true;
				sexGroup.selectedIndex=0;
			}
			
			updateJobDes();
			updateAvatar();
			
			displaySexGrp();
			resetTime();
		}
		
		private function displaySexGrp():void
		{
			
			if(jobGroup.selectedIndex!=2)
			{
				if (_skin.grp_sex.scale!=0) 
				{
					TweenLite.to(_skin.grp_sex,0.4,{scale:0,alpha:0});
				}
				
			}else
			{
				if (_skin.grp_sex.scale!=1) 
				{
					TweenLite.to(_skin.grp_sex,0.4,{scale:1,alpha:1,ease: Bounce.easeOut});
					sexGroup.selectedIndex=0;
				}
			
				
			}
		}
		
		private function updateJobDes():void
		{
			jobDes.visible=false;
			jobDes=jobDesList[jobGroup.selectedIndex];
			jobDes.visible=true;			
		}
		
		private function onStageResize(e : flash.events.Event = null) : void
		{
			this.x=(_stage.stageWidth-this._skin.imgbg.width)>>1;
			this.y=(_stage.stageHeight-this._skin.imgbg.height)>>1;
			
		}
		
		private function initAvatar():void
		{
			_avatar=new InterAvatar3D();
			_avatar.x=700;
			_avatar.y=780;
			bgEft=new Inter3DContainer();
			bgEft.playInter3DAt(ClientConfig.getEffect("ui_xuanren"),0,0,0);
			this.addChildAt(bgEft,1);
			this.addChild3D(this._avatar);
			_avatarData=new RoleData(0);
			
			initAvatarInfo();
			
			//updateAvatar();
		}
		
		private function initAvatarInfo():void
		{
			//兵家
			job_info_0=new AvatarInfo();
			job_info_0.setBodyResID("pc/body/binjia_skin","pc/body/binjia_animat");
			job_info_0.hairResID = "pc/hair/bingjia_toufa_skin";
			job_info_0.weaponResID = "pc/weapon/binjia_wq_changqiang_004";
			job_info_0.weaponEffectID = "tx_changmao_01";
			job_info_0.deputyWeaponResID = null;	
			
			//医家
			job_info_1=new AvatarInfo();
			job_info_1.setBodyResID("pc/body/yijia_w_pl06_skin","pc/body/yijia_w_pl06_animat");
			job_info_1.hairResID = "pc/hair/yijia_w_m_pl06_toufa_skin";
			job_info_1.weaponResID = "pc/weapon/yijia_wq_umbrella_004-guanbi";
			job_info_1.weaponEffectID = "tx_san_01";
			job_info_1.deputyWeaponResID = null;			
			
			//墨家
			job_info_2=new AvatarInfo();
			job_info_2.setBodyResID("pc/body/mojia_m_pl04_skin","pc/body/mojia_m_pl04_animat");
			job_info_2.hairResID = "pc/hair/mojia_m_pl04_toufa_skin";
			job_info_2.weaponResID = "pc/weapon/mojia_wq_crossbow_007";
			job_info_2.weaponEffectID = "tx_nu_01";
			job_info_2.deputyWeaponResID = "pc/weapon/mojia_wq_crossbow_007";			
			job_info_2.deputyWeaponEffectID="tx_nu_01";
			
			job_info_3=new AvatarInfo();
			job_info_3.setBodyResID("pc/body/mojia_m_pl04_skin","pc/body/mojia_m_pl04_animat");
			job_info_3.hairResID = "pc/hair/mojia_m_pl04_toufa_skin";
			job_info_3.weaponResID = "pc/weapon/mojia_wq_crossbow_007";
			job_info_3.weaponEffectID = "tx_nu_01";
			job_info_3.deputyWeaponResID = "pc/weapon/mojia_wq_crossbow_007";		
			job_info_3.deputyWeaponEffectID="tx_nu_01";
			
			avatarInfos=new Array();
			avatarInfos.push([job_info_0,null]);
			avatarInfos.push([null,job_info_1]);
			avatarInfos.push([job_info_2,job_info_3]);
			
			jobTyps=new Array();
			jobTyps.push([JobType.JOB_B_M,null]);
			jobTyps.push([null,JobType.JOB_Y_W]);
			jobTyps.push([JobType.JOB_M_M,JobType.JOB_M_W]);
			
		}
		
		private function updateAvatar(e:away3d.events.Event=null) : void 
		{
			this._avatarData.avatarInfo.clear();
			this._avatar.setRoleData(this._avatarData);
			var sexIndex:int;
			if(jobGroup.selectedIndex==0){
				sexIndex=0;
			}else if(jobGroup.selectedIndex==1){
				sexIndex=1;
			}else{
				sexIndex=sexGroup.selectedIndex;
			}
			this._avatarData.avatarInfo.setBodyResID(avatarInfos[jobGroup.selectedIndex][sexIndex].bodyResID, avatarInfos[jobGroup.selectedIndex][sexIndex].bodyAnimatResID);
			this._avatarData.avatarInfo.hairResID = avatarInfos[jobGroup.selectedIndex][sexIndex].hairResID;
			this._avatarData.avatarInfo.weaponResID = avatarInfos[jobGroup.selectedIndex][sexIndex].weaponResID;
			this._avatarData.avatarInfo.weaponEffectID = avatarInfos[jobGroup.selectedIndex][sexIndex].weaponEffectID;
			this._avatarData.avatarInfo.weaponEffectScale = avatarInfos[jobGroup.selectedIndex][sexIndex].weaponEffectScale;
			this._avatarData.avatarInfo.deputyWeaponResID = avatarInfos[jobGroup.selectedIndex][sexIndex].deputyWeaponResID;
			this._avatarData.avatarInfo.deputyWeaponEffectID = avatarInfos[jobGroup.selectedIndex][sexIndex].deputyWeaponEffectID;
		
			
			this._avatar.setRoleData(this._avatarData);
			this._avatar.role.setScale(3);
			this._avatar.role.rotationX=0;
			resetTime();
		}
		
		public function destroy() : void
		{
			if (_stage)
			{
				_stage.removeEventListener(flash.events.Event.RESIZE, onStageResize);
				_stage = null;
			}
			
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouch);
			
			sexGroup.addEventListener(away3d.events.Event.CHANGE, updateAvatar );
			jobGroup.addEventListener(away3d.events.Event.CHANGE, jobChangeHandler );
			
			if (parent)
				parent.removeChild(this);
			DisplayUtil.disposeDisplayContainer(this);
			gameTimer.destroy();
			gameTimer=null;
		}
	}
}
package com.rpgGame.appModule.fightsoul
{
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.FightsoulData;
	import com.rpgGame.coreData.cfg.FightsoulModeData;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_mode;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import org.mokylin.skin.app.zhanhun.ZhanHun_ShengJi;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 战魂升级
	 *@author dik
	 *2017-8-5下午12:07:43
	 **/
	public class FightSoulRiseShowPanel extends SkinUIPanel
	{
		private var _skin:ZhanHun_ShengJi;
		
		private var currentShowMode:int;
		private var level:int;
		
		private var fight_soul_atts:Array=[CharAttributeType.WAI_GONG,CharAttributeType.DEFENSE_PER,CharAttributeType.HP,CharAttributeType.SHENFA,CharAttributeType.HIT];
		private var attRiseViews:Vector.<PropView>;
		private var avatar:UIAvatar3D;
		private var _showAvatarData : RoleData;
		
		public function FightSoulRiseShowPanel()
		{
			this.model=true;
			_skin=new ZhanHun_ShengJi();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			attRiseViews=new Vector.<PropView>();
			for(var i:int=0;i<fight_soul_atts.length;i++){
				attRiseViews.push(new PropView(_skin["lab_prop"+(i+1)].skin,fight_soul_atts[i]));
			}
			avatar=new UIAvatar3D(_skin.roleGrp);
			_showAvatarData=new RoleData(0);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			currentShowMode = FightSoulManager.instance().currentMode.q_mode;
			level= FightSoulManager.instance().fightSoulInfo.level;
			var job:int = MainRoleManager.actorInfo.job;
			var currentatt:Q_att_values = AttValueConfig.getAttInfoById( FightSoulManager.instance().currentLeveldata.q_baseAtt_id);
			var preSoul:Q_fightsoul= FightsoulData.getInfobyId(level-1);
			var preAtt:Q_att_values= AttValueConfig.getAttInfoById(preSoul.q_baseAtt_id);
			var currentPower:int = FightValueUtil.calFightPowerByAttValue(currentatt,job);
			var prePower:int=FightValueUtil.calFightPowerByAttValue(preAtt,job);
			
			var addPower:int=(currentPower-prePower);
			_skin.userData.number=currentPower;
			_skin.num_lv.number=addPower;
			_skin.ico_up.x=_skin.userData.x+_skin.userData.width+5;
			_skin.num_lv.x=_skin.ico_up.x+18;
			
			for(var i:int=0;i<fight_soul_atts.length;i++){
				attRiseViews[i].updataAtt(preAtt,currentatt);
				attRiseViews[i].showUpLevelView(true);
			}
			
			var modeinfo:Q_fightsoul_mode = FightsoulModeData.getModeInfoById(currentShowMode);
			this._showAvatarData.avatarInfo.setBodyResID("pc/fightsoul/"+modeinfo.q_mode,null);
			this._showAvatarData.avatarInfo.bodyEffectID =modeinfo.q_effect;
			this._showAvatarData.avatarInfo.bodyEffectID2 =modeinfo.q_effect1;
			avatar.setRoleData(this._showAvatarData);
			var scale:Number = modeinfo.q_panleScale/100;
			avatar.setScale(scale);
			avatar.y=modeinfo.q_panleY-150;
			
			_skin.zhanhunName.styleName = "ui/app/zhanhun/modename/"+currentShowMode+".png";
		}
	}
}
package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.shortcut_Skin;
	
	import starling.animation.IAnimatable;

	public class HpPropgressBar implements IAnimatable
	{
		private var _shor:ShortcutBar;
		private var _display:UIAsset;
		private var _mask:DrawBow;
		private var renderUint:RenderUnit3D;
		private var _diection:int;
		private var _skin : shortcut_Skin;
		private var _info:HeroData;
		private var _diectionoff:int;
		private var _effect3d:InterObject3D;
		private var _mask3d:InterObject3D;
		public function HpPropgressBar(content:ShortcutBar,diection:int,skin : shortcut_Skin):void
		{
			_shor = content;
			_diection = diection;
			_skin = skin;
			init();
		}
		private function init():void
		{
			_info=MainRoleManager.actorInfo;
			var effectuls:String;
			var effectuls1:String = "";
			if(_diection==1)
			{
				_display = _skin.right_nengliangMask;
				if(_info.job == JobEnum.ROLE_1_TYPE)
				{
					effectuls =EffectUrl.XUE_TIAO_JIN;
					effectuls1 = EffectUrl.XUE_TIAO_JIN1;
					_skin.right_jintiao.visible =true;
					EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,statResChangeHandler);
				}
				else{
					effectuls =EffectUrl.XUE_TIAO_LAN;
					effectuls1 = EffectUrl.XUE_TIAO_LAN1;
					_skin.right_jintiao.visible =false;
					EventManager.addEvent(MainPlayerEvent.NOWMP_CHANGE,MpCHangeHandler);
					EventManager.addEvent(MainPlayerEvent.MAXMP_CHANGE,MpCHangeHandler);
				}
			}else{
				_display = _skin.left_xuecaoMask; 
				effectuls =EffectUrl.XUE_TIAO_HONG;
				effectuls1 = EffectUrl.XUE_TIAO_HONG1;
				EventManager.addEvent(MainPlayerEvent.MAXHP_CHANGE,HpCHangeHandler);
				EventManager.addEvent(MainPlayerEvent.NOWHP_CHANGE,HpCHangeHandler);
			}
			var index:int = _shor.getChildIndex(_display);
			_effect3d= new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect(effectuls));
			_effect3d.addRenderUnitWith(data, 0, null);
			_shor.addChild3DAt(_effect3d,index);
			renderUint=RenderUnit3D(_effect3d.baseObj3D);
			renderUint.setAddedCallBack(onAddHpEft,_effect3d);
			
			if(effectuls1!="")
			{
				_mask3d  = new InterObject3D();
				data= new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect(effectuls1));
				_mask3d.addRenderUnitWith(data, 0, null);
				index = _shor.getChildIndex(_display);
				_shor.addChild3DAt(_mask3d,index+1);
				renderUint=RenderUnit3D(_mask3d.baseObj3D);
				renderUint.setAddedCallBack(onAddEftTop,_mask3d);
			}
			
			_mask = new DrawBow(80,80);
			if(_diection==1)
			{
				_mask.x = 681;
				_mask.drawAngle(Math.PI*1.3,0);
				_diectionoff = -1;
			}else{
				_mask.x = 130;   
				_mask.drawAngle(Math.PI,Math.PI*1.70);
				_diectionoff = 1;
			}
			_mask.y = 117;
			_display.mask = _mask;
			_shor.addChild(_mask);
			if(_diection==1)
			{
				if(_info.job == JobEnum.ROLE_1_TYPE){
					statResChangeHandler(CharAttributeType.RES_NU_QI);
				}
				else{
					MpCHangeHandler(_info);
				}
			}else{
				HpCHangeHandler(_info);
			}
//			Starling.juggler.add(this);
		}
		
		private function statResChangeHandler(type:int):void
		{
			if(type!= CharAttributeType.RES_NU_QI)
				return ;
			var current:int = _info.totalStat.getResData(type)
			percentage(current/100);
			var Msg:String = "怒气："+current+"/100";
			Msg += "<br/>施放技能会消耗怒气<br/>受到攻击或损失气血会增加怒气";
			TipTargetManager.show(_skin.mask_blue, TargetTipsMaker.makeSimpleTextTips(Msg));
		}
		
		private function HpCHangeHandler(role:RoleData):void
		{
			if(role != _info)
				return ;
			percentage(_info.totalStat.hp/_info.totalStat.life);
			TipTargetManager.show(_skin.mask_red, TargetTipsMaker.makeSimpleTextTips("血量："+_info.totalStat.hp+"/"+_info.totalStat.life+"<br/>使用药品可以恢复血量"));
		}
		private function MpCHangeHandler(role:RoleData):void
		{
			if(role != _info)
				return ;
			var currentmp:int = _info.totalStat.getStatValue(CharAttributeType.MP);
			var maxmp:int = _info.totalStat.getStatValue(CharAttributeType.MAX_MP)
			percentage(currentmp/maxmp);
			var Msg:String = "能量："+currentmp+"/"+maxmp;
			Msg += "<br/>施放技能会消耗能量<br/>";
			if(_info.job == JobEnum.ROLE_4_TYPE)
				Msg += "每秒恢复7点能量";
			else(_info.job == JobEnum.ROLE_4_TYPE)
				Msg += "每秒恢复5点能量";
			TipTargetManager.show(_skin.mask_blue, TargetTipsMaker.makeSimpleTextTips(Msg));
		}
		private function onAddHpEft(sr3D:InterObject3D,renderUint:RenderUnit3D):void
		{
			renderUint.removeAddedCallBack(onAddHpEft);
			renderUint.scaleX=renderUint.scaleY=_display.width/270;
			if(_diection==1)
			{
				sr3D.x=_display.x+_display.width-22;
			}else{
				sr3D.x=130
			}
			sr3D.y=_display.y+_display.height-8;
		}
		
		private function onAddEftTop(sr3D:InterObject3D,renderUint:RenderUnit3D):void
		{
			renderUint.removeAddedCallBack(onAddEftTop);
			renderUint.scaleX=renderUint.scaleY=_display.width/275;
			if(_diection==1)
			{
				sr3D.x= 681;
				sr3D.y=_display.y+_display.height;
			}else{
				sr3D.x= 127;
				sr3D.y=_display.y+_display.height-5;
			}
		}
		private function percentage(value:Number):void
		{
			if(value<0)
				value = 0;
			else if(value>1)
				value = 1;
			_mask.rotation = _diectionoff*Math.PI*0.7*value;
			if(_diection==1)
			{
				_mask3d.baseObj3D.rotationZ =-(_diectionoff*180*0.7*value)+3;
			}else{
				_mask3d.baseObj3D.rotationZ =-(_diectionoff*180*0.74*value-1);
			}
				
		}
		private var totalNum:Number = 0;
		public function advanceTime(time:Number):void
		{
			totalNum +=time/5;
			percentage(totalNum%1.0);
//			percentage(0);
		}
	}
}
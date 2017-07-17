package com.rpgGame.app.manager
{
	import com.game.engine3D.scene.display.Render3DText;
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	import gs.TweenLite;

	/**
	 *战斗头上特效管理 
	 * @author YT
	 * 
	 */	
	public class FightHeadEffectManager
	{
		public function FightHeadEffectManager()
		{
		}
		
		public static function addHeadKillToTarget( target : SceneRole):void
		{
			var rud : RenderParamData3D = new RenderParamData3D(RenderUnitID.BLEED, RenderUnitType.HEADKILL, ClientConfig.getEffect("tx_liuxuexiaoguo"));
			var effectRu : RenderUnit3D;
			effectRu = target.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01, rud);
			//effectRu.renderParamData.
			effectRu.allowCameraAnimator = target.isMainChar;
			effectRu.repeat = 0;
			effectRu.x = 0;
			effectRu.y = 0;
			effectRu.z = 0;
			effectRu.rotationY = 0;
			//effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, target.avatar);
			effectRu.play(1);
			
			var rudText : RenderParamData3D = new RenderParamData3D(RenderUnitID.BLEED_TEXT, RenderUnitType.HEADKILL, ClientConfig.getEffect("tx_shuzi_bai"));
			var effectRuText : RenderUnit3D;
			effectRuText = target.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01, rudText);
			//effectRu.renderParamData.
			effectRuText.allowCameraAnimator = target.isMainChar;
			effectRuText.repeat = 0;
			effectRuText.x = 0;
			effectRuText.y = 0;
			effectRuText.z = 0;
			effectRuText.rotationY = 0;
			effectRuText.scaleX=0.5;
			effectRuText.scaleY=0.5;
			effectRuText.scaleZ=0.5;
			//effectRuText.setPlayCompleteCallBack(avatarRuPlayComplete, target.avatar);
			effectRuText.play(1100);
			effectRuText.stop(1100);
			//effectRu.setStatus();
		}
		
		
		
		
		public static function addHeadWarningEffect( target : SceneRole, time:int=0):void
		{
			if(target.avatar.hasIDRenderUnit(RenderUnitType.HEADKILL,RenderUnitID.BLEED))
			{
				TweenLite.killDelayedCallsTo(headWarningEffectPlayComplete);
				TweenLite.delayedCall(playTime, headWarningEffectPlayComplete,[target]);
				return;
			}
			
			var rud : RenderParamData3D = new RenderParamData3D(RenderUnitID.BLEED, RenderUnitType.HEADKILL, ClientConfig.getEffect("tx_dianmingyujing"));
			var effectRu : RenderUnit3D;
			effectRu = target.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01, rud);
			effectRu.allowCameraAnimator = target.isMainChar;
			effectRu.repeat = 0;
			effectRu.x = 0;
			effectRu.y = 0;
			effectRu.z = 0;
			effectRu.rotationY = 0;
			effectRu.play(1);
			var playTime:Number=time>=0?time*0.001:effectRu.totalDuration*0.001;
			//
			if(playTime>0)
			{
				TweenLite.delayedCall(playTime, headWarningEffectPlayComplete,[target]);
			}
			
		}
		private static function headWarningEffectPlayComplete(target : SceneRole) : void
		{
			target.avatar.removeRenderUnitByID(RenderUnitType.HEADKILL,RenderUnitID.BLEED);
		}
		
	}
}
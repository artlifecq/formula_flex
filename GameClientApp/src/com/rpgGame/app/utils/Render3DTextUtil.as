package com.rpgGame.app.utils
{
	import com.game.engine3D.scene.display.Render3DText;
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.BaseEntity;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.vo.Render3DTextData;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	/**
	 *
	 * 3D文字渲染工具
	 * @author L.L.M.Sunny
	 * 创建时间：2016-10-10 下午1:26:38
	 *
	 */
	public class Render3DTextUtil
	{
		public function Render3DTextUtil()
		{
		}
		public static function addHeadKillToTarget( target : SceneRole):Render3DText
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
			effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, target.avatar);
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
			effectRuText.setPlayCompleteCallBack(avatarRuPlayComplete, target.avatar);
			effectRuText.play(1100);
			effectRuText.stop(1100);
			//effectRu.setStatus();
			
			return null;
		}
		private static function avatarRuPlayComplete(avatar : RenderSet3D, ru : RenderUnit3D) : void
		{
			avatar.removeRenderUnit(ru);
		}
		/**
		 * 添加鲜花赠送文字
		 * @param entity
		 * @return
		 *
		 */
		public static function addHeadFlowerTextToTarget( entity:BaseEntity ):Render3DText
		{
			var renderText:Render3DText = Render3DText.create( RenderUnitType.BODY_HEAD_FLOWER_TEXT, 100 );
			//			renderText.billboardMode = true;
			renderText.align = "center";
			entity.addBaseObjToUnitChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01, renderText);
			
			
			
			var textDatas : Vector.<Render3DTextData> = new Vector.<Render3DTextData>();
			
			var meigui:Render3DTextData = new Render3DTextData("meigui",200 );
			meigui.addStyle("style1", ClientConfig.getEffect("tx_dianmingyujing"));
			meigui.addCharSet( "h", 100 );
			textDatas.push( meigui );
			
			//			for (var i : int = 0; i < 10; i++)
			//			{
			var data : Render3DTextData = new Render3DTextData("shuzi", 20);
			data.addStyle("style1", ClientConfig.getEffect("tx_shuzi_bai"));
			data.addCharSet("x", 100);
			data.addCharSet("0", 1100);
			data.addCharSet("1", 2100);
			data.addCharSet("2", 3100);
			data.addCharSet("3", 4100);
			data.addCharSet("4", 5100);
			data.addCharSet("5", 6100);
			data.addCharSet("6", 7100);
			data.addCharSet("7", 8100);
			data.addCharSet("8", 9100);
			data.addCharSet("9", 11000);
			textDatas.push(data);
			//			}
			renderText.setTextDatas(textDatas);
			
			return renderText;
		}
	}
}

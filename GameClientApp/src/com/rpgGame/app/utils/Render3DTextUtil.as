package com.rpgGame.app.utils
{
	import com.game.engine3D.scene.display.Render3DText;
	import com.game.engine3D.scene.render.vo.BaseEntity;
	import com.game.engine3D.vo.Render3DTextData;
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
			meigui.addStyle("style1", ClientConfig.getEffect("tx_shuzi_meigui"));
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

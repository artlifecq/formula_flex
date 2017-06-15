package com.rpgGame.app.utils
{
	import com.game.engine3D.scene.display.Render3DText;
	import com.game.engine3D.scene.render.vo.BaseEntity;
	import com.game.engine3D.vo.Render3DTextData;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	
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
		
		public static const styleName_Meigui:String = "meigui";
		public static const styleName_Shuzi:String = "shuzi";
		
		private static var meiguilist:HashMap = new HashMap();
		private static var numberlist:HashMap = new HashMap();
		private static var effectTweenMap:HashMap = new HashMap();
		private static var temp:Object = {};
		
		private static function getRender3DTextDataList(meiguiRes:String, colorRes:String):Vector.<Render3DTextData>
		{
			var meigui:Render3DTextData = null;
			var textDatas:Vector.<Render3DTextData>;
			var i:int = 0;
			var data : Render3DTextData = null;
			var list:Vector.<Render3DTextData> = temp[(meiguiRes + colorRes)] as Vector.<Render3DTextData>;
			if (list == null)
			{
				list = new Vector.<Render3DTextData>();
				meigui = meiguilist.getValue(meiguiRes) as Render3DTextData;
				if (meigui == null)
				{
					meigui = new Render3DTextData(styleName_Meigui, 0);
					meigui.addStyle("style1", ClientConfig.getEffect(meiguiRes));
					meigui.addCharSet("h", 100);
					meiguilist.add(meiguiRes, meigui);
				}
				if (meigui != null)
				{
					list.push(meigui);
				}
				textDatas = numberlist.getValue(meiguiRes) as Vector.<Render3DTextData>;
				if (textDatas == null)
				{
					textDatas = new Vector.<Render3DTextData>();
					while (i < 10)
					{
						data = new Render3DTextData("shuzi", 0);
						data.addStyle("style1", ClientConfig.getEffect(colorRes));
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
						i++;
					}
					numberlist.add(colorRes, textDatas);
				}
				if (textDatas != null)
				{
					list = list.concat(textDatas);
				}
				temp[(meiguiRes + colorRes)] = list;
			}
			return list;
		}
		
		/**
		 * 添加鲜花赠送文字
		 * @param entity
		 * @return
		 *
		 */
//		public static function addHeadFlowerTextToTarget1( entity:BaseEntity ):Render3DText
//		{
//			var renderText:Render3DText = Render3DText.create( RenderUnitType.BODY_HEAD_FLOWER_TEXT, 100 );
////			renderText.billboardMode = true;
//			renderText.align = "center";
//			entity.addBaseObjToUnitChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01, renderText);
//			
//			
//			
//			var textDatas : Vector.<Render3DTextData> = new Vector.<Render3DTextData>();
//			
//			var meigui:Render3DTextData = new Render3DTextData(styleName_Meigui,200 );
//			meigui.addStyle("style1", ClientConfig.getEffect("tx_shuzi_meigui"));
//			meigui.addCharSet( "h", 100 );
//			textDatas.push( meigui );
//			
//			//			for (var i : int = 0; i < 10; i++)
//			//			{
//			var data : Render3DTextData = new Render3DTextData(styleName_Shuzi, 20);
//			data.addStyle("style1", ClientConfig.getEffect("tx_shuzi_bai"));
//			data.addCharSet("x", 100);
//			data.addCharSet("0", 1100);
//			data.addCharSet("1", 2100);
//			data.addCharSet("2", 3100);
//			data.addCharSet("3", 4100);
//			data.addCharSet("4", 5100);
//			data.addCharSet("5", 6100);
//			data.addCharSet("6", 7100);
//			data.addCharSet("7", 8100);
//			data.addCharSet("8", 9100);
//			data.addCharSet("9", 11000);
//			textDatas.push(data);
//			//			}
//			renderText.setTextDatas(textDatas);
//			
//			return renderText;
//		}
		
		public static function addHeadFlowerTextToTarget(entity:SceneRole, meiguiRes:String, colorRes:String, cgfId:int, str:String, disappearTime:Number=0):Render3DText
		{
			var textDatas:Vector.<Render3DTextData> = getRender3DTextDataList(meiguiRes, colorRes);
			var renderText:Render3DText = entity.getBaseObjByID("body_head_flower_text", cgfId) as Render3DText;
			if (renderText == null)
			{
				renderText = Render3DText.create("body_head_flower_text", cgfId);
				renderText.align = "center";
				renderText.setAddedCallBack(function (_arg1:Render3DText):void
				{
					refreshHeadFlowerTextLayout(entity);
				});
				if (entity.stateMachine.isShowRiding)
				{
					entity.addBaseObjToUnitChild(RenderUnitType.MOUNT, RenderUnitID.MOUNT, BoneNameEnum.c_0_name_01, renderText, true);
				}
				else
				{
					entity.addBaseObjToUnitChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01, renderText, true);
				}
			}
			renderText.setTextDatas(textDatas);
			renderText.setStyle(styleName_Meigui, "style1");
			renderText.setStyle(styleName_Shuzi, "style1");
			renderText.text = "hx" + str;
			refreshHeadFlowerTextLayout(entity);
			if (disappearTime > 0)
			{
				var duration:Number = disappearTime - SystemTimeManager.curtTm;
				var tween:TweenLite = TweenLite.delayedCall((duration * 0.001), onRemoveHeadFlowerText, [entity, cgfId]);
				effectTweenMap.add((entity.id + cgfId), tween);
			}
			return renderText;
		}
		
		private static function onRemoveHeadFlowerText(entity:BaseEntity, cgfId:int):void
		{
			var tw:TweenLite = null;
			if (entity != null)
			{
				entity.removeBaseObjByID("body_head_flower_text", cgfId);
				tw = effectTweenMap.getValue(entity.id) as TweenLite;
				if (tw)
				{
					tw.kill();
					effectTweenMap.remove((entity.id + cgfId));
				}
				refreshHeadFlowerTextLayout(entity);
			}
		}
		
		public static function refreshHeadFlowerTextLayout(entity:BaseEntity):void
		{
			var i:int = 0;
			var j:int = 0;
			var render3DText:Render3DText = null;
			var texts:Array = entity.getBaseObjsByType("body_head_flower_text");
			texts.sort(sortOnText);
			while (i < texts.length)
			{
				render3DText = (texts[i] as Render3DText);
				if (render3DText != null)
				{
					render3DText.offsetY = ((entity as SceneRole).headFace as HeadFace).flowerY + (j * (render3DText.textHeight + 5));
					j++;
				}
				i++;
			}
		}
		
		private static function sortOnText(a:Render3DText, b:Render3DText):int
		{
			var numa:int = int(a.text.replace("hx", ""));
			var numb:int = int(b.text.replace("hx", ""));
			if (numa > numb)
			{
				return -1;
			}
			if (numa < numb)
			{
				return 1;
			}
			return 0;
		}
		
		public static function getHeadFlowerTextOffsetY(entity:BaseEntity):int
		{
			var i:int = 0;
			var txt:Render3DText = null;
			var offsetY:int;
			var txts:Array = entity.getBaseObjsByType("body_head_flower_text");
			while (i < txts.length)
			{
				txt = txts[i] as Render3DText;
				if (txt != null)
				{
					offsetY = offsetY + txt.offsetY;
				}
				i++;
			}
			return offsetY;
		}
	}
}

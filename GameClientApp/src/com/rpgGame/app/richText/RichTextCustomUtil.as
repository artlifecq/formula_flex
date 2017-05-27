/*
使用示例：
!!!非输入框=================================================================
//定义默认格式，查原生api
var defaultFormat:TextFormat = new TextFormat(Fontter.FONT_Hei);
defaultFormat.color = 0xded8c7;
defaultFormat.size = 14;
defaultFormat.align = TextFieldAutoSize.LEFT;
//创建富文本框
var _richText:RichTextArea3D = new RichTextArea3D( _chatBarSkin.scroller.width - 30);
//设置快捷命令配置，比如表情,具体配置格式和方法见RichTextCustomUtil.cloneChatUnitConfigVec
_richText.setConfig(RichTextCustomUtil.cloneChatUnitConfigVec());
_richText.wordWrap = true;
_richText.multiline = true;
_richText.x = 3;
_richText.y = 6;
_richText.defaultTextFormat = defaultFormat;
//设置宽高
_chatText.setSize( _chatBarSkin.scroller.width - 30 );
//重置文本
_chatText.text = "";
//添加文本，这个方法非输入文本框会自动换行，而输入框不会
_chatText.appendRichText( ChatUtil.getChatMessageByChannel( info.channel, content ) );

!!!输入框=================================================================
var inputText:RichTextArea3D = new RichTextArea3D(skin.textInput.width,skin.textInput.height);
inputText.setConfig(RichTextCustomUtil.cloneChatUnitConfigVec());
//设置最大输入字符数
inputText.maxChars = 50;
//设置是否自动换行和是否多行输入
inputText.wordWrap = true;
inputText.multiline = true;
//设置是否是输入文本框
inputText.isEditable = true;
inputText.x = skin.textInput.x;
inputText.y = skin.textInput.y + 2;
inputText.defaultTextFormat = defaultFormat;
inputText.addEventListener(FeathersEventType.FOCUS_IN,inputFocusInHandler);
inputText.addEventListener(FeathersEventType.FOCUS_OUT,inputFocusOutHandler);
inputText.addEventListener(Event.CHANGE,onChange);
//访问剩余可输入字符数，与Event.CHANGE事件配合显示提示
inputText.remainChars
//访问是否是输入焦点状态
inputText.isInputFocus
//设置焦点
inputText.setFocus();
//设置光标位置
inputText.selectRange(index,index);
//访问文本框的文本，此处指源码,与设置时相同
inputText.text

富文本内容相关接口=================================================================
//添加文本链接对象，比如一个人名链接
var linkTextCode:String = RichTextCustomUtil.getTextLinkCode("某某某",0xFFFFFF,RichTextCustomLinkType.ROLE_NAME_TYPE, "携带的数据");
inputText.appendRichText(linkTextCode);
//添加一个图标，比如小飞鞋
var imageCode:String = RichTextCustomUtil.getImageLinkCode("aaa.png",RichTextCustomLinkType.TASK_FLY_TYPE, "携带的数据");
inputText.appendRichText(imageCode);
//添加一个物品文本链接
var goodsCode:String = RichTextCustomUtil.getItemCode(cfgId,name,quality);
inputText.appendRichText(goodsCode);
//添加一个表情动画,快捷键参考RichTextCustomUtil.cloneChatUnitConfigVec配置
inputText.appendRichText("表情对应的快捷键");
//把富文本单元的代码替换成普通显示的标签
var unitLabel:String = RichTextConfig.replaceUnitCodeToLabel(goodsCode);
//把富文本单元的代码数据转换成一个格式化的数据对象
var unitData:RichTextUnitData = RichTextConfig.getUnitData(goodsCode);

!!!处理以及扩展链接事件类型，比如玩家名字、物品名字、坐标位置、任务目标=================================================================
RichTextCustomLinkType
RichTextCustomUtil.onClickFunc
RichTextCustomUtil.onMouseOut
RichTextCustomUtil.onMouseMove

!!!扩展富文本单元类型，已有链接文本、图标、动画=================================================================
RichTextCustomUnitType
RichTextCustomUtil.updateRichUnit

*/
package com.rpgGame.app.richText
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.chat.ChatGoodsManager;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.chat.FaceLoadManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.richText.component.RichTextConfig;
	import com.rpgGame.app.richText.component.RichTextUnit;
	import com.rpgGame.app.richText.component.RichTextUnitConfigData;
	import com.rpgGame.app.richText.component.RichTextUnitData;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipManager;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.FaceCfgData;
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.type.item.ItemQualityType;
	
	import flash.geom.Point;
	
	import app.message.GoodsType;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.text.Fontter;
	
	import org.game.netCore.data.long;
	
	import starling.text.TextFieldAutoSize;
	
	/**
	 * 富文本自定义工具类，由项目维护
	 * @author GuoDong.Zhang
	 * 创建时间：2016-7-5 下午4:09:36
	 *
	 */
	public class RichTextCustomUtil
	{
		
		/**配置回调函数*/
		RichTextArea3D.onMouseClickUnit = onClickFunc;
		RichTextArea3D.onMouseMoveUnit = onMouseMove;
		RichTextArea3D.onMouseOverUnit = onMouseOver;
		RichTextArea3D.onMouseOutUnit = onMouseOut;
		RichTextArea3D.updateUnitDisplayObjFunc = updateRichUnit;
		
		/**聊天所需富文本单元配置列表*/
		private static var _chatUnitConfigVect : Vector.<RichTextUnitConfigData>;
		
		/**
		 * 克隆聊天所需富文本单元配置列表
		 * @return
		 *
		 */
		public static function cloneChatUnitConfigVec() : Vector.<RichTextUnitConfigData>
		{
			if (_chatUnitConfigVect == null)
			{
				_chatUnitConfigVect = new Vector.<RichTextUnitConfigData>();
				var faces : Array = FaceCfgData.getAllFace();
				faces.sort(FaceCfgData.sortByIndex);
				var unitConfigData : RichTextUnitConfigData;
				for each (var faceInfo : FaceInfo in faces)
				{
					unitConfigData = new RichTextUnitConfigData();
					unitConfigData.shortcutCode = faceInfo.str;
					unitConfigData.type = faceInfo.type;
					unitConfigData.res = faceInfo.key;
					_chatUnitConfigVect.push(unitConfigData);
				}
			}
			return _chatUnitConfigVect.concat();
		}
		
		
		/**
		 * 获得文本链接的代码
		 * @param label 显示的标签名
		 * @param labelColor 显示的标签颜色
		 * @param linkType 链接的数据类型
		 * @param linkData 链接的数据
		 * @return
		 *
		 */
		public static function getTextLinkCode(label : String = null, labelColor : Number = -1, linkType : String = null, linkData : String = null) : String
		{
			return RichTextConfig.getCode(RichTextCustomUnitType.LINK, null, label, labelColor, linkType, linkData);
		}
		
		/**
		 * 获得图标对象的代码
		 * @param res 对应的图标的资源(UIAsset的styleName)
		 * @param linkType 链接的数据类型
		 * @param linkData 链接的数据
		 * @return
		 *
		 */
		public static function getImageLinkCode(res : String, linkType : String = null, linkData : String = null, offsetY : int = 0) : String
		{
			return RichTextConfig.getCode(RichTextCustomUnitType.IMAGE, res, null, -1, linkType, linkData, offsetY);
		}
		
		/**
		 * 获得动画对象的代码
		 * @param res 对应的动画的资源(可以自定义，最终在updateMovieClip处理)
		 * @param linkType 链接的数据类型
		 * @param linkData 链接的数据
		 * @return
		 *
		 */
		public static function getMovieClipLinkCode(res : String, linkType : String = null, linkData : String = null) : String
		{
			return RichTextConfig.getCode(RichTextCustomUnitType.MOVIECLIP, res, null, -1, linkType, linkData);
		}
		
		/**
		 * 物品名称代码
		 *
		 * @param id
		 * @param itemName
		 * @param qualiy
		 * @return
		 *
		 */
		public static function getItemCode(id : String, itemName : String, qualiy : int) : String
		{
			return getTextLinkCode(itemName, ItemQualityType.getColorValue(qualiy), RichTextCustomLinkType.ITEM_SHOW_TYPE, id + "," + qualiy.toString());
		}
		
		/**
		 * 小飞鞋图标代码
		 * @param sceneId
		 * @param sceneX
		 * @param sceneY
		 * @param line
		 * @param sceneCountry
		 * @return
		 *
		 */
		public static function getPositionCode(sceneId : int, sceneX : int, sceneY : int, line : int, sceneCountry : int, offsetY : int = 0) : String
		{
			return RichTextConfig.getCode(RichTextCustomUnitType.IMAGE, AssetUrl.POSITION_FLY_TYPE_ICORES, null, -1, RichTextCustomLinkType.POSITION_FLY_TYPE, sceneId + "," + sceneX + "," + sceneY + "," + line + "," + sceneCountry, offsetY);
		}
		
		/**
		 * 富文本单元被点击回调函数
		 * @param type
		 * @param data
		 *
		 */
		public static function onClickFunc(unit : RichTextUnit) : void
		{
			var unitData : RichTextUnitData = unit.unitData;
			switch (unitData.linkType)
			{
				case RichTextCustomLinkType.ROLE_NAME_TYPE:
					//获取人物名;
					//trace( "点击打开这个人的属性面板，id：",data.id," 英雄名字：",data.data1 );
					var userID : String = unitData.linkData;
					var uise:Number=(new long(userID)).ToGID();
					if (MainRoleManager.isSelf(uise))
					{
						return;
					}
					//					var poswr:Point = unit.displayObj.parent.localToGlobal(new Point(unit.displayObj.x+2,unit.displayObj.y));
					var userName : String = unitData.label;
					var menus : Array = MenuUtil.getPlayerTargetMenu(uise, true);
					MenuManager.showMenu(menus, [userID, userName], -1, -1, 80);
					break;
				case RichTextCustomLinkType.POSITION_TYPE:
					//获取XY坐标
					//trace( "移动到这个坐标:" + "[" + data.data1 + "," + data.data2 + "]" );
					var pos : Array = unitData.linkData.split(",");
					MainRoleSearchPathManager.walkToScene(pos[0], pos[1], pos[2], null, 200);
					break;
				case RichTextCustomLinkType.POSITION_FLY_TYPE:
					//trace( "飞到这个坐标:" + "[" + data.data1 + "," + data.data2 + "]" );
					var flypos : Array = unitData.linkData.split(",");
					MainRoleSearchPathManager.walkToScene(flypos[0], flypos[1], flypos[2], null, 200);
					break;
				case RichTextCustomLinkType.ITEM_SHOW_TYPE:
					var info:ClientItemInfo=ChatManager.getShowItemInfo(unitData);
					if(info is EquipInfo)//.type==GoodsType.EQUIPMENT||info.type==GoodsType.EQUIPMENT1||info.type==GoodsType.EQUIPMENT2
						TipTargetManager.show( unit.displayObj, TargetTipsMaker.makeTips( TipType.EQUIP_TIP, info ,true) );
					else
						TipTargetManager.show( unit.displayObj, TargetTipsMaker.makeTips( TipType.ITEM_TIP, info ,true) );
					break;
				case RichTextCustomLinkType.TASK_NPC_NAME_TYPE:
					var npcId : int = parseInt(unitData.linkData); //任务，npc的id
					TaskUtil.replyNpcTask(npcId);
					break;
				
				case RichTextCustomLinkType.TASK_KILL_MONSTER_TYPE:
					var monsterId : int = parseInt(unitData.linkData);
					TaskUtil.killMonsterTask(monsterId);
					break;
				case RichTextCustomLinkType.TASK_COLLECT_KILL_MONSTER_TYPE:
					var collectMonsterId : int = parseInt(unitData.linkData);
					//这里应该是寻路过去然后杀怪
					TaskUtil.killMonsterTask(collectMonsterId);
					break;
				case RichTextCustomLinkType.TASK_COLLECT_TYPE:
					var idArr : Array = unitData.linkData.split(",");
					var taskId : int = idArr[0]; //采集物品的ID
					var objectID : int = idArr[1]; //采集物品的ID
					var collectGoodsType : int = idArr[2]; //采集物品的ID
					var sceneID : int = idArr[3];
					var posx : int = idArr[4];
					var posy : int = idArr[5];
					//到地方了开始采集
					TaskUtil.collectItemTask(taskId, objectID, collectGoodsType, sceneID, posx, posy);
					break;
				case RichTextCustomLinkType.TASK_FLY_TYPE:
					var taskInfo : Array = unitData.linkData.split(",");
					var taskIndex : int = taskInfo[0];
					var taskType : int = taskInfo[1];
					TaskUtil.flyToPos(taskType, taskIndex);
					break;
				case RichTextCustomLinkType.TASK_FOLLOW_ESCORT_TYPE:
					TaskUtil.followEscortTask(parseInt(unitData.linkData));
					break;
				case RichTextCustomLinkType.TASK_TO_SCENE_POS_TYPE:
					TaskUtil.toScenePosTask(unitData.linkData);
					break;
				case RichTextCustomLinkType.WALK_TO_SCENE_POS_TYPE:
					MainRoleSearchPathManager.walkToSceneByLink(unitData.linkData);
					break;
				case RichTextCustomLinkType.TASK_TO_NPC_DIAILOG_TYPE:
					TaskUtil.toNpcDiailog(parseInt(unitData.linkData));
					break;
				case RichTextCustomLinkType.WALK_TO_SCENE_MONSTER_TYPE:
					//					TaskUtil.walkToSceneMonster(parseInt(unitData.linkData));
					break;
			}
		}
		/**
		 * 鼠标移入事件，可以根据类型来写不同的效果
		 *
		 */
		public static function onMouseOver(unit : RichTextUnit) : void
		{
			var unitData : RichTextUnitData = unit.unitData;
			switch (unitData.linkType)
			{
				case RichTextCustomLinkType.ITEM_SHOW_TYPE:
					TipTargetManager.remove( unit.displayObj );
					var info:ClientItemInfo=ChatManager.getShowItemInfo(unitData);
					if(info is EquipInfo)
						TipTargetManager.show( unit.displayObj, TargetTipsMaker.makeTips( TipType.EQUIP_TIP, info ,true) );
					else
						TipTargetManager.show( unit.displayObj, TargetTipsMaker.makeTips( TipType.ITEM_TIP, info ,true) );
					break;
			}
		}
		
		/**
		 * 鼠标移出事件，可以根据类型来写不同的效果
		 *
		 */
		public static function onMouseOut(unit : RichTextUnit) : void
		{
			var unitData : RichTextUnitData = unit.unitData;
			if (unitData.type == RichTextCustomUnitType.LINK && unitData.linkType == RichTextCustomLinkType.ITEM_SHOW_TYPE)
			{
				TipTargetManager.remove( unit.displayObj );
				TipManager.remove();
			}
		}
		
		/**
		 * 鼠标移动事件，可以根据类型来写不同的效果
		 *
		 */
		public static function onMouseMove(unit : RichTextUnit) : void
		{
			var unitData : RichTextUnitData = unit.unitData;
			if (unitData.type == RichTextCustomUnitType.LINK && unitData.linkType == RichTextCustomLinkType.ITEM_SHOW_TYPE)
			{
				var itemInfo:ClientItemInfo = ChatManager.getShowItemInfo(unit.unitData);
				//				switch( itemInfo.type )
				//				{
				//					case GoodsType.EQUIPMENT://装备
				//						TipManager.show( TargetTipsMaker.makeTips( TipType.EQUIP_TIP, itemInfo ) );
				//						break;
				//					case GoodsType.BEAST_CARD://兽牌
				//						TipManager.show( TargetTipsMaker.makeTips( TipType.MOUNT_BEAST_CARD_TIP, itemInfo ) );
				//						break;
				//					case GoodsType.MOUNT_SPELL_BOOK://坐骑技能书
				//						TipManager.show( TargetTipsMaker.makeTips( TipType.ITEM_TIP, itemInfo ) );
				//						break;
				//					default:
				//						TipManager.show( TargetTipsMaker.makeTips( TipType.ITEM_TIP, itemInfo ) );
				//						break;
				//				}
			}
		}
		
		/**
		 * 更新富文本单元
		 *
		 */
		public static function updateRichUnit(unit : RichTextUnit) : void
		{
			switch (unit.unitData.type)
			{
				case RichTextCustomUnitType.IMAGE:
					updateImage(unit);
					break;
				case RichTextCustomUnitType.LINK:
					updateTextLink(unit);
					break;
				case RichTextCustomUnitType.MOVIECLIP:
					FaceLoadManager.loadFace(updateMovieClip, [unit]);
					break;
			}
		}
		
		/**
		 * 生成动态表情
		 *
		 */
		private static function updateMovieClip(unit : RichTextUnit) : void
		{
			var movieClass : Class = FaceCfgData.getFaceInfoByKey(unit.unitData.res).faceClass;
			
			var movieClip : UIMovieClip = unit.displayObj as UIMovieClip;
			if (movieClip == null)
			{
				movieClip = new UIMovieClip();
				movieClip.autoPlay = true;
				movieClip.frameRate = 6;
				unit.displayObj = movieClip;
			}
			movieClip.styleClass = movieClass;
			unit.onDisplayObjLoaded();
		}
		
		//-----------------------------------
		/**
		 * 设置图标
		 * @param imageUrl
		 *
		 */
		private static function updateImage(unit : RichTextUnit) : void
		{
			var image : UIAsset = unit.displayObj as UIAsset;
			if (image == null)
			{
				image = new UIAsset();
				unit.displayObj = image;
			}
			image.onImageLoaded = unit.onDisplayObjLoaded;
			image.styleName = unit.unitData.res;
		}
		
		/**
		 * 设置文本
		 * @param title
		 *
		 */
		private static function updateTextLink(unit : RichTextUnit) : void
		{
			var textField : Label = unit.displayObj as Label;
			var label : String = "<u>" + unit.unitData.label + "</u>";
			if (textField == null)
			{
				textField = new Label();
				textField.autoSize = TextFieldAutoSize.HORIZONTAL;
				textField.fontSize = unit.unitData.labelSize;
				textField.isHtmlText = true;
				textField.fontName = Fontter.FONT_Hei;
				textField.color = unit.unitData.labelColor;
				textField.nativeFilters = unit.unitData.labelFilters;
				textField.htmlText = label;
			}
			else
			{
				textField.color = unit.unitData.labelColor;
				textField.htmlText = label;
			}
			unit.displayObj = textField;
			unit.onDisplayObjLoaded();
			if (unit.unitData.type == RichTextCustomUnitType.LINK && unit.unitData.linkType == RichTextCustomLinkType.ITEM_SHOW_TYPE)
			{
				//				var itemInfo:ItemInfo = ChatManager.getShowItemInfo(unit.unitData);
				//				switch( itemInfo.type )
				//				{
				//					case GoodsType.EQUIPMENT://装备
				//						TipTargetManager.show( textField, TargetTipsMaker.makeTips( TipType.EQUIP_TIP, itemInfo ) );
				//						break;
				//					case GoodsType.BEAST_CARD://兽牌
				//						TipTargetManager.show( textField, TargetTipsMaker.makeTips( TipType.MOUNT_BEAST_CARD_TIP, itemInfo ) );
				//						break;
				//					case GoodsType.MOUNT_SPELL_BOOK://坐骑技能书
				//						TipTargetManager.show( textField, TargetTipsMaker.makeTips( TipType.ITEM_TIP, itemInfo ) );
				//						break;
				//					default:
				//						TipTargetManager.show( textField, TargetTipsMaker.makeTips( TipType.ITEM_TIP, itemInfo ) );
				//						break;
				//				}
			}
		}
		
	}
}

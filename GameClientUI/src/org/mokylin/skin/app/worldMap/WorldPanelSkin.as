package org.mokylin.skin.app.worldMap
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.worldMap.button.ButtonBian_jing;
	import org.mokylin.skin.app.worldMap.button.ButtonLuo_yang_cheng;
	import org.mokylin.skin.app.worldMap.button.ButtonTao_yuan_zhen;
	import org.mokylin.skin.app.worldMap.button.ButtonWang_cheng;
	import org.mokylin.skin.app.worldMap.button.ButtonYang_ping_guan;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WorldPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bianJingBtn:feathers.controls.Button;

		public var bianJingLevelTxt:feathers.controls.Label;

		public var luoYangChengBtn:feathers.controls.Button;

		public var luoYangChengLevelTxt:feathers.controls.Label;

		public var selfIcon:feathers.controls.Group;

		public var taoYuanZhenBtn:feathers.controls.Button;

		public var taoYuanZhenLevelTxt:feathers.controls.Label;

		public var wangChengBtn:feathers.controls.Button;

		public var wangChengLevelTxt:feathers.controls.Label;

		public var yangPingGuanBtn:feathers.controls.Button;

		public var yangPingGuanLevelTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WorldPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 517;
			this.width = 857;
			this.elementsContent = [__WorldPanelSkin_UIAsset1_i(),__WorldPanelSkin_UIAsset2_i(),wangChengLevelTxt_i(),bianJingLevelTxt_i(),yangPingGuanLevelTxt_i(),taoYuanZhenLevelTxt_i(),luoYangChengLevelTxt_i(),wangChengBtn_i(),taoYuanZhenBtn_i(),yangPingGuanBtn_i(),bianJingBtn_i(),luoYangChengBtn_i(),selfIcon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __WorldPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 517;
			temp.styleName = "ui/common/kang/nei_kuang.png";
			temp.width = 857;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __WorldPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 500;
			temp.styleName = "ui/big_bg/worldmap.jpg";
			temp.width = 840;
			temp.x = 8;
			temp.y = 8;
			return temp;
		}

		private function __WorldPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/worldmap/ding_wei_di.png";
			temp.x = 0;
			temp.y = 29;
			return temp;
		}

		private function __WorldPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/worldmap/ding_wei.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bianJingBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			bianJingBtn = temp;
			temp.name = "bianJingBtn";
			temp.height = 24;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.worldMap.button.ButtonBian_jing);
			temp.width = 44;
			temp.x = 428;
			temp.y = 367;
			return temp;
		}

		private function bianJingLevelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			bianJingLevelTxt = temp;
			temp.name = "bianJingLevelTxt";
			temp.fontSize = 14;
			temp.text = "99级";
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 57;
			temp.x = 423;
			temp.y = 391;
			return temp;
		}

		private function luoYangChengBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			luoYangChengBtn = temp;
			temp.name = "luoYangChengBtn";
			temp.height = 30;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.worldMap.button.ButtonLuo_yang_cheng);
			temp.width = 68;
			temp.x = 497;
			temp.y = 400;
			return temp;
		}

		private function luoYangChengLevelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			luoYangChengLevelTxt = temp;
			temp.name = "luoYangChengLevelTxt";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "99级";
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 57;
			temp.x = 504;
			temp.y = 429;
			return temp;
		}

		private function selfIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			selfIcon = temp;
			temp.name = "selfIcon";
			temp.height = 43;
			temp.width = 30;
			temp.x = 760;
			temp.y = 420;
			temp.elementsContent = [__WorldPanelSkin_UIAsset3_i(),__WorldPanelSkin_UIAsset4_i()];
			return temp;
		}

		private function taoYuanZhenBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			taoYuanZhenBtn = temp;
			temp.name = "taoYuanZhenBtn";
			temp.height = 30;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.worldMap.button.ButtonTao_yuan_zhen);
			temp.width = 68;
			temp.x = 502;
			temp.y = 306;
			return temp;
		}

		private function taoYuanZhenLevelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			taoYuanZhenLevelTxt = temp;
			temp.name = "taoYuanZhenLevelTxt";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "99级";
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 57;
			temp.x = 508;
			temp.y = 336;
			return temp;
		}

		private function wangChengBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			wangChengBtn = temp;
			temp.name = "wangChengBtn";
			temp.height = 30;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.worldMap.button.ButtonWang_cheng);
			temp.width = 68;
			temp.x = 427;
			temp.y = 167;
			return temp;
		}

		private function wangChengLevelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			wangChengLevelTxt = temp;
			temp.name = "wangChengLevelTxt";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "99级";
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 57;
			temp.x = 434;
			temp.y = 195;
			return temp;
		}

		private function yangPingGuanBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			yangPingGuanBtn = temp;
			temp.name = "yangPingGuanBtn";
			temp.height = 24;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.worldMap.button.ButtonYang_ping_guan);
			temp.width = 58;
			temp.x = 471;
			temp.y = 259;
			return temp;
		}

		private function yangPingGuanLevelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			yangPingGuanLevelTxt = temp;
			temp.name = "yangPingGuanLevelTxt";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "99级";
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 57;
			temp.x = 472;
			temp.y = 282;
			return temp;
		}

	}
}
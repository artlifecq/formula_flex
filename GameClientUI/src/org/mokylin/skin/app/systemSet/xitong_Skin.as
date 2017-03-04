package org.mokylin.skin.app.systemSet
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Slider;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.slider.skin_Slider2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class xitong_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var chk_jujuebanghui:feathers.controls.Check;

		public var chk_jujuehaoyou:feathers.controls.Check;

		public var chk_jujuesiliao:feathers.controls.Check;

		public var chk_jujuezudui:feathers.controls.Check;

		public var chk_moren:feathers.controls.Check;

		public var chk_yinxiao:feathers.controls.Check;

		public var chk_yinyue:feathers.controls.Check;

		public var grp_shejiao:feathers.controls.Group;

		public var grp_sound:feathers.controls.Group;

		public var sld_yinxiao:feathers.controls.Slider;

		public var sld_yinyue:feathers.controls.Slider;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function xitong_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__xitong_Skin_UIAsset1_i(),__xitong_Skin_UIAsset2_i(),grp_sound_i(),grp_shejiao_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __xitong_Skin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拒绝他人帮会邀请";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 36;
			temp.y = 167;
			return temp;
		}

		private function __xitong_Skin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "默认加入其他人的组队邀请";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 36;
			temp.y = 207;
			return temp;
		}

		private function __xitong_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "游戏音量设置";
			temp.color = 0xe8c958;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __xitong_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "音乐";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 38;
			temp.y = 44;
			return temp;
		}

		private function __xitong_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "音效";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 38;
			temp.y = 82;
			return temp;
		}

		private function __xitong_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "30%";
			temp.textAlign = "right";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 41;
			temp.x = 323;
			temp.y = 45;
			return temp;
		}

		private function __xitong_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "30%";
			temp.textAlign = "right";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 41;
			temp.x = 323;
			temp.y = 83;
			return temp;
		}

		private function __xitong_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "游戏社交设置";
			temp.color = 0xe8c958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __xitong_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拒绝他人加我好友";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 36;
			temp.y = 36;
			return temp;
		}

		private function __xitong_Skin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拒绝接受私聊信息";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 36;
			temp.y = 78;
			return temp;
		}

		private function __xitong_Skin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拒绝他人组队邀请";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 36;
			temp.y = 124;
			return temp;
		}

		private function __xitong_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 470;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 405;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __xitong_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/fen.png";
			temp.x = 17;
			temp.y = 163;
			return temp;
		}

		private function chk_jujuebanghui_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_jujuebanghui = temp;
			temp.name = "chk_jujuebanghui";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 3;
			temp.y = 168;
			return temp;
		}

		private function chk_jujuehaoyou_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_jujuehaoyou = temp;
			temp.name = "chk_jujuehaoyou";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 3;
			temp.y = 39;
			return temp;
		}

		private function chk_jujuesiliao_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_jujuesiliao = temp;
			temp.name = "chk_jujuesiliao";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 3;
			temp.y = 81;
			return temp;
		}

		private function chk_jujuezudui_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_jujuezudui = temp;
			temp.name = "chk_jujuezudui";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 3;
			temp.y = 125;
			return temp;
		}

		private function chk_moren_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_moren = temp;
			temp.name = "chk_moren";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 3;
			temp.y = 208;
			return temp;
		}

		private function chk_yinxiao_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_yinxiao = temp;
			temp.name = "chk_yinxiao";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 2;
			temp.y = 85;
			return temp;
		}

		private function chk_yinyue_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_yinyue = temp;
			temp.name = "chk_yinyue";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 2;
			temp.y = 46;
			return temp;
		}

		private function grp_shejiao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_shejiao = temp;
			temp.name = "grp_shejiao";
			temp.x = 11;
			temp.y = 198;
			temp.elementsContent = [__xitong_Skin_Label6_i(),chk_jujuehaoyou_i(),chk_jujuesiliao_i(),chk_jujuezudui_i(),chk_jujuebanghui_i(),chk_moren_i(),__xitong_Skin_Label7_i(),__xitong_Skin_Label8_i(),__xitong_Skin_Label9_i(),__xitong_Skin_Label10_i(),__xitong_Skin_Label11_i()];
			return temp;
		}

		private function grp_sound_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_sound = temp;
			temp.name = "grp_sound";
			temp.x = 11;
			temp.y = 18;
			temp.elementsContent = [__xitong_Skin_Label1_i(),chk_yinyue_i(),chk_yinxiao_i(),__xitong_Skin_Label2_i(),__xitong_Skin_Label3_i(),__xitong_Skin_Label4_i(),__xitong_Skin_Label5_i(),sld_yinyue_i(),sld_yinxiao_i()];
			return temp;
		}

		private function sld_yinxiao_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			sld_yinxiao = temp;
			temp.name = "sld_yinxiao";
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider2;
			temp.value = 3;
			temp.width = 240;
			temp.x = 85;
			temp.y = 81;
			return temp;
		}

		private function sld_yinyue_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			sld_yinyue = temp;
			temp.name = "sld_yinyue";
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider2;
			temp.value = 3;
			temp.width = 240;
			temp.x = 85;
			temp.y = 44;
			return temp;
		}

	}
}
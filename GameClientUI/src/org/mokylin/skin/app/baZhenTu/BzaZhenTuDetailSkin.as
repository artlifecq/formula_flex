package org.mokylin.skin.app.baZhenTu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;
	import org.mokylin.skin.component.button.ButtonSkin_jian_btn;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BzaZhenTuDetailSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var dungeonCdLabel:feathers.controls.Label;

		public var exitBtn:feathers.controls.Button;

		public var guaiWuCdLabel:feathers.controls.Label;

		public var img_0:feathers.controls.UIAsset;

		public var img_1:feathers.controls.UIAsset;

		public var img_2:feathers.controls.UIAsset;

		public var img_3:feathers.controls.UIAsset;

		public var img_4:feathers.controls.UIAsset;

		public var img_5:feathers.controls.UIAsset;

		public var img_6:feathers.controls.UIAsset;

		public var img_7:feathers.controls.UIAsset;

		public var minBtn:feathers.controls.Button;

		public var yiChuXianGw:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BzaZhenTuDetailSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__BzaZhenTuDetailSkin_UIAsset1_i(),__BzaZhenTuDetailSkin_UIAsset2_i(),__BzaZhenTuDetailSkin_UIAsset3_i(),__BzaZhenTuDetailSkin_UIAsset4_i(),minBtn_i(),__BzaZhenTuDetailSkin_UIAsset5_i(),__BzaZhenTuDetailSkin_UIAsset6_i(),__BzaZhenTuDetailSkin_UIAsset7_i(),__BzaZhenTuDetailSkin_UIAsset8_i(),__BzaZhenTuDetailSkin_UIAsset9_i(),__BzaZhenTuDetailSkin_Label1_i(),__BzaZhenTuDetailSkin_Label2_i(),__BzaZhenTuDetailSkin_Label3_i(),__BzaZhenTuDetailSkin_Label4_i(),__BzaZhenTuDetailSkin_Label5_i(),__BzaZhenTuDetailSkin_Label6_i(),__BzaZhenTuDetailSkin_UIAsset10_i(),exitBtn_i(),img_6_i(),img_0_i(),img_3_i(),img_1_i(),img_2_i(),img_4_i(),img_7_i(),img_5_i(),dungeonCdLabel_i(),yiChuXianGw_i(),guaiWuCdLabel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BzaZhenTuDetailSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "八阵图";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 100;
			temp.y = 3;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "副本倒计时：";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 16;
			temp.y = 41;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "已出现怪物：";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 16;
			temp.y = 70;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "怪物出现倒计时：";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 16;
			temp.y = 103;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "当前八阵图效果：";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 16;
			temp.y = 133;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "八阵图激活石碑：";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 15;
			temp.y = 250;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/baZhenTu/di.png";
			temp.x = 16;
			temp.y = 287;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 560;
			temp.styleName = "ui/common/backgound/sanjimianban.png";
			temp.width = 252;
			temp.x = 0;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/xiaotaitou.png";
			temp.width = 250;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 208;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 242;
			temp.x = 4;
			temp.y = 32;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 273;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 242;
			temp.x = 4;
			temp.y = 244;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 234;
			temp.x = 8;
			temp.y = 39;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 234;
			temp.x = 8;
			temp.y = 70;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 234;
			temp.x = 8;
			temp.y = 101;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 234;
			temp.x = 8;
			temp.y = 132;
			return temp;
		}

		private function __BzaZhenTuDetailSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 234;
			temp.x = 8;
			temp.y = 250;
			return temp;
		}

		private function dungeonCdLabel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			dungeonCdLabel = temp;
			temp.name = "dungeonCdLabel";
			temp.fontSize = 14;
			temp.text = "20:20";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 128;
			temp.x = 108;
			temp.y = 41;
			return temp;
		}

		private function exitBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			exitBtn = temp;
			temp.name = "exitBtn";
			temp.label = "退出副本";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_getequip;
			temp.x = 89;
			temp.y = 522;
			return temp;
		}

		private function guaiWuCdLabel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guaiWuCdLabel = temp;
			temp.name = "guaiWuCdLabel";
			temp.fontSize = 14;
			temp.text = "20:20";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 128;
			temp.y = 104;
			return temp;
		}

		private function img_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img_0 = temp;
			temp.name = "img_0";
			temp.styleName = "ui/app/baZhenTu/kun.png";
			temp.x = 16;
			temp.y = 287;
			return temp;
		}

		private function img_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img_1 = temp;
			temp.name = "img_1";
			temp.styleName = "ui/app/baZhenTu/kan.png";
			temp.x = 16;
			temp.y = 287;
			return temp;
		}

		private function img_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img_2 = temp;
			temp.name = "img_2";
			temp.styleName = "ui/app/baZhenTu/gen.png";
			temp.x = 16;
			temp.y = 287;
			return temp;
		}

		private function img_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img_3 = temp;
			temp.name = "img_3";
			temp.styleName = "ui/app/baZhenTu/xun.png";
			temp.x = 16;
			temp.y = 287;
			return temp;
		}

		private function img_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img_4 = temp;
			temp.name = "img_4";
			temp.styleName = "ui/app/baZhenTu/shen.png";
			temp.x = 16;
			temp.y = 287;
			return temp;
		}

		private function img_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img_5 = temp;
			temp.name = "img_5";
			temp.styleName = "ui/app/baZhenTu/li.png";
			temp.x = 16;
			temp.y = 287;
			return temp;
		}

		private function img_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img_6 = temp;
			temp.name = "img_6";
			temp.styleName = "ui/app/baZhenTu/dui.png";
			temp.x = 16;
			temp.y = 287;
			return temp;
		}

		private function img_7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img_7 = temp;
			temp.name = "img_7";
			temp.styleName = "ui/app/baZhenTu/zheng.png";
			temp.x = 16;
			temp.y = 287;
			return temp;
		}

		private function minBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			minBtn = temp;
			temp.name = "minBtn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian_btn;
			temp.x = 224;
			temp.y = 4;
			return temp;
		}

		private function yiChuXianGw_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			yiChuXianGw = temp;
			temp.name = "yiChuXianGw";
			temp.fontSize = 14;
			temp.text = "20:20";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 128;
			temp.x = 109;
			temp.y = 70;
			return temp;
		}

	}
}
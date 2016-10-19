package org.mokylin.skin.app.baZhenTu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu;
	import org.mokylin.skin.component.list.ListSkin3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BaZhenTuDungeonEndPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var chengGongGroup:feathers.controls.Group;

		public var leaveBtn:feathers.controls.Button;

		public var list:feathers.controls.List;

		public var shiBaiGroup:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BaZhenTuDungeonEndPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [shiBaiGroup_i(),chengGongGroup_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset9_i(),list_i(),leaveBtn_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset10_i(),__BaZhenTuDungeonEndPanelSkin_Label1_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset11_i(),__BaZhenTuDungeonEndPanelSkin_Label2_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset12_i(),__BaZhenTuDungeonEndPanelSkin_Label3_i(),__BaZhenTuDungeonEndPanelSkin_Label4_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset13_i(),__BaZhenTuDungeonEndPanelSkin_Label5_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset14_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BaZhenTuDungeonEndPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "玩家姓名";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 134;
			temp.x = 182;
			temp.y = 316;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "击杀 BOSS";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 499;
			temp.y = 316;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "复活次数";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 611;
			temp.y = 316;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "击杀小怪";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 320;
			temp.y = 316;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "击杀精英";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 406;
			temp.y = 316;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 30;
			temp.styleName = "ui/app/account/lie_biao_title.png";
			temp.width = 580;
			temp.x = 160;
			temp.y = 310;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/fen_ge_fu.png";
			temp.x = 318;
			temp.y = 314;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/fen_ge_fu.png";
			temp.x = 604;
			temp.y = 314;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/fen_ge_fu.png";
			temp.x = 400;
			temp.y = 314;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/fen_ge_fu.png";
			temp.x = 486;
			temp.y = 314;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/shi_bai/1-DiGuang-ShiSBai.png";
			temp.x = 108;
			temp.y = 60;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/shi_bai/3-Long-ShiSBai.png";
			temp.x = 130;
			temp.y = 114;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/shi_bai/2-DiGuang-ShiSBai.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/shi_bai/ShiBai.png";
			temp.x = 214;
			temp.y = 183;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/cheng_gong/guang_xiao_1.png";
			temp.x = 108;
			temp.y = 60;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/cheng_gong/guang_xiao_3.png";
			temp.x = 130;
			temp.y = 114;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/cheng_gong/guang_xiao_2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/cheng_gong/tiao_zhan_cheng_gong.png";
			temp.x = 214;
			temp.y = 174;
			return temp;
		}

		private function __BaZhenTuDungeonEndPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/account/di_kuang.png";
			temp.x = 0;
			temp.y = 250;
			return temp;
		}

		private function chengGongGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			chengGongGroup = temp;
			temp.name = "chengGongGroup";
			temp.x = 76;
			temp.y = 0;
			temp.elementsContent = [__BaZhenTuDungeonEndPanelSkin_UIAsset5_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset6_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset7_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset8_i()];
			return temp;
		}

		private function leaveBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			leaveBtn = temp;
			temp.name = "leaveBtn";
			temp.height = 36;
			temp.label = "离开副本";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu;
			temp.width = 100;
			temp.x = 402;
			temp.y = 536;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 180;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin3;
			temp.width = 570;
			temp.x = 160;
			temp.y = 340;
			return temp;
		}

		private function shiBaiGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			shiBaiGroup = temp;
			temp.name = "shiBaiGroup";
			temp.x = 76;
			temp.y = 0;
			temp.elementsContent = [__BaZhenTuDungeonEndPanelSkin_UIAsset1_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset2_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset3_i(),__BaZhenTuDungeonEndPanelSkin_UIAsset4_i()];
			return temp;
		}

	}
}
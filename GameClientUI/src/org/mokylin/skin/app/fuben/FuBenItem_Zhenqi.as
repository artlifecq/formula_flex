package org.mokylin.skin.app.fuben
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.fuben.uinumber.UINumberFubenzhanli;
	import org.mokylin.skin.component.button.ButtonSkin_putong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBenItem_Zhenqi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnEnter:feathers.controls.Button;

		public var btnReset:feathers.controls.Button;

		public var coustgroup:feathers.controls.Group;

		public var grpFirst:feathers.controls.Group;

		public var grpXin:feathers.controls.Group;

		public var grpXinL:feathers.controls.Group;

		public var iconFirst:feathers.controls.UIAsset;

		public var icon_1:feathers.controls.UIAsset;

		public var icon_2:feathers.controls.UIAsset;

		public var icon_3:feathers.controls.UIAsset;

		public var lastCombatCount:feathers.controls.Group;

		public var lbNum:feathers.controls.Label;

		public var lbYuanbao:feathers.controls.Label;

		public var lxin1:feathers.controls.UIAsset;

		public var lxin2:feathers.controls.UIAsset;

		public var lxin3:feathers.controls.UIAsset;

		public var numZhanli:feathers.controls.UINumber;

		public var uiBg:feathers.controls.UIAsset;

		public var uiFirst:feathers.controls.UIAsset;

		public var uiJiangli:feathers.controls.UIAsset;

		public var uiLevel:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var uiOk:feathers.controls.UIAsset;

		public var xin1:feathers.controls.UIAsset;

		public var xin2:feathers.controls.UIAsset;

		public var xin3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBenItem_Zhenqi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 380;
			this.width = 194;
			this.elementsContent = [uiBg_i(),uiName_i(),uiLevel_i(),grpFirst_i(),uiJiangli_i(),icon_1_i(),icon_2_i(),icon_3_i(),grpXin_i(),grpXinL_i(),__FuBenItem_Zhenqi_UIAsset1_i(),numZhanli_i(),lastCombatCount_i(),coustgroup_i(),btnEnter_i(),btnReset_i(),uiOk_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBenItem_Zhenqi_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "剩余次数：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FuBenItem_Zhenqi_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __FuBenItem_Zhenqi_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/tuijianzhanli.png";
			temp.x = 17;
			temp.y = 282;
			return temp;
		}

		private function __FuBenItem_Zhenqi_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 42;
			temp.y = 0;
			return temp;
		}

		private function btnEnter_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnEnter = temp;
			temp.name = "btnEnter";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "挑 战";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.visible = false;
			temp.width = 79;
			temp.x = 58;
			temp.y = 335;
			return temp;
		}

		private function btnReset_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnReset = temp;
			temp.name = "btnReset";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "重 置";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 79;
			temp.x = 58;
			temp.y = 300;
			return temp;
		}

		private function coustgroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			coustgroup = temp;
			temp.name = "coustgroup";
			temp.x = 47;
			temp.y = 350;
			temp.elementsContent = [__FuBenItem_Zhenqi_Label2_i(),lbYuanbao_i(),__FuBenItem_Zhenqi_UIAsset2_i()];
			return temp;
		}

		private function grpFirst_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFirst = temp;
			temp.name = "grpFirst";
			temp.x = 10;
			temp.y = 35;
			temp.elementsContent = [uiFirst_i(),iconFirst_i()];
			return temp;
		}

		private function grpXinL_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpXinL = temp;
			temp.name = "grpXinL";
			temp.x = 45;
			temp.y = 243;
			temp.elementsContent = [lxin1_i(),lxin2_i(),lxin3_i()];
			return temp;
		}

		private function grpXin_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpXin = temp;
			temp.name = "grpXin";
			temp.x = 45;
			temp.y = 243;
			temp.elementsContent = [xin1_i(),xin2_i(),xin3_i()];
			return temp;
		}

		private function iconFirst_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconFirst = temp;
			temp.name = "iconFirst";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/60.png";
			temp.x = 51;
			temp.y = 28;
			return temp;
		}

		private function icon_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_1 = temp;
			temp.name = "icon_1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 19;
			temp.y = 174;
			return temp;
		}

		private function icon_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_2 = temp;
			temp.name = "icon_2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 73;
			temp.y = 174;
			return temp;
		}

		private function icon_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_3 = temp;
			temp.name = "icon_3";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 127;
			temp.y = 174;
			return temp;
		}

		private function lastCombatCount_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			lastCombatCount = temp;
			temp.name = "lastCombatCount";
			temp.x = 57;
			temp.y = 336;
			temp.elementsContent = [__FuBenItem_Zhenqi_Label1_i(),lbNum_i()];
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "1";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 18;
			temp.x = 70;
			temp.y = 0;
			return temp;
		}

		private function lbYuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbYuanbao = temp;
			temp.name = "lbYuanbao";
			temp.text = "9999";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 42;
			temp.x = 70;
			temp.y = 4;
			return temp;
		}

		private function lxin1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lxin1 = temp;
			temp.name = "lxin1";
			temp.styleName = "ui/app/fuben/liangxing.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lxin2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lxin2 = temp;
			temp.name = "lxin2";
			temp.styleName = "ui/app/fuben/liangxing.png";
			temp.x = 36;
			temp.y = 0;
			return temp;
		}

		private function lxin3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lxin3 = temp;
			temp.name = "lxin3";
			temp.styleName = "ui/app/fuben/liangxing.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function numZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhanli = temp;
			temp.name = "numZhanli";
			temp.gap = 0;
			temp.height = 18;
			temp.label = "9999999999";
			temp.styleClass = org.mokylin.skin.app.fuben.uinumber.UINumberFubenzhanli;
			temp.width = 87;
			temp.x = 97;
			temp.y = 282;
			return temp;
		}

		private function uiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBg = temp;
			temp.name = "uiBg";
			temp.styleName = "ui/big_bg/fuben/zhenqi/bg1.jpg";
			return temp;
		}

		private function uiFirst_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFirst = temp;
			temp.name = "uiFirst";
			temp.styleName = "ui/app/fuben/shoutongjiangli.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiJiangli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJiangli = temp;
			temp.name = "uiJiangli";
			temp.styleName = "ui/app/fuben/tongguanjiangli.png";
			temp.x = 10;
			temp.y = 151;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/app/fuben/mc/kaiqidengji/kaiqi_50.png";
			temp.x = 29;
			temp.y = 323;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/fuben/mc/zhenqi/50.png";
			temp.x = 44;
			temp.y = 5;
			return temp;
		}

		private function uiOk_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOk = temp;
			temp.name = "uiOk";
			temp.styleName = "ui/app/fuben/yinzhang.png";
			temp.x = 45;
			temp.y = 70;
			return temp;
		}

		private function xin1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xin1 = temp;
			temp.name = "xin1";
			temp.styleName = "ui/app/fuben/anxing.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function xin2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xin2 = temp;
			temp.name = "xin2";
			temp.styleName = "ui/app/fuben/anxing.png";
			temp.x = 36;
			temp.y = 0;
			return temp;
		}

		private function xin3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xin3 = temp;
			temp.name = "xin3";
			temp.styleName = "ui/app/fuben/anxing.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

	}
}
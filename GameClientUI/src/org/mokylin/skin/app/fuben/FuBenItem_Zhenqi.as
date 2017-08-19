package org.mokylin.skin.app.fuben
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.fuben.uinumber.UINumberFubenzhanli;
	import org.mokylin.skin.component.button.ButtonSkin_putong4;

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

		public var combatgroup:feathers.controls.Group;

		public var grpFirst:feathers.controls.Group;

		public var grpXin:feathers.controls.Group;

		public var grpXinL:feathers.controls.Group;

		public var grp_Tuijian:feathers.controls.Group;

		public var iconFirst:feathers.controls.UIAsset;

		public var icon_2:feathers.controls.UIAsset;

		public var lbNum:feathers.controls.Label;

		public var lbYuanbao:feathers.controls.Label;

		public var lbshenyuName:feathers.controls.Label;

		public var lxin1:feathers.controls.UIAsset;

		public var lxin2:feathers.controls.UIAsset;

		public var lxin3:feathers.controls.UIAsset;

		public var numZhanli:feathers.controls.UINumber;

		public var resetgroup:feathers.controls.Group;

		public var uiBg:feathers.controls.UIAsset;

		public var uiFirst:feathers.controls.UIAsset;

		public var uiJiangli:feathers.controls.UIAsset;

		public var uiLevel:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var uiTishi:feathers.controls.UIAsset;

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
			this.height = 418;
			this.width = 221;
			this.elementsContent = [uiBg_i(),__FuBenItem_Zhenqi_UIAsset1_i(),uiName_i(),uiLevel_i(),grpFirst_i(),uiJiangli_i(),icon_2_i(),grpXin_i(),grpXinL_i(),grp_Tuijian_i(),combatgroup_i(),resetgroup_i(),uiTishi_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBenItem_Zhenqi_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.horizontalAlign = "center";
			temp.verticalAlign = "bottom";
			return temp;
		}

		private function __FuBenItem_Zhenqi_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 5;
			temp.y = 34;
			return temp;
		}

		private function __FuBenItem_Zhenqi_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/wenzishangdi.png";
			temp.x = 32;
			temp.y = 2;
			return temp;
		}

		private function __FuBenItem_Zhenqi_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/tuijianzhanli.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FuBenItem_Zhenqi_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 47;
			temp.y = 31;
			return temp;
		}

		private function btnEnter_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnEnter = temp;
			temp.name = "btnEnter";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "挑 战";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xEAEABC;
			temp.width = 80;
			temp.x = 35;
			temp.y = 0;
			return temp;
		}

		private function btnReset_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnReset = temp;
			temp.name = "btnReset";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "重 置";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xEAEABC;
			temp.width = 80;
			temp.x = 18;
			temp.y = 0;
			return temp;
		}

		private function combatgroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			combatgroup = temp;
			temp.name = "combatgroup";
			temp.width = 136;
			temp.x = 36;
			temp.y = 356;
			temp.elementsContent = [lbshenyuName_i(),lbNum_i(),btnEnter_i()];
			return temp;
		}

		private function grpFirst_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFirst = temp;
			temp.name = "grpFirst";
			temp.x = 25;
			temp.y = 51;
			temp.elementsContent = [uiFirst_i(),iconFirst_i()];
			return temp;
		}

		private function grpXinL_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpXinL = temp;
			temp.name = "grpXinL";
			temp.x = 58;
			temp.y = 283;
			temp.elementsContent = [lxin1_i(),lxin2_i(),lxin3_i()];
			return temp;
		}

		private function grpXin_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpXin = temp;
			temp.name = "grpXin";
			temp.x = 58;
			temp.y = 283;
			temp.elementsContent = [xin1_i(),xin2_i(),xin3_i()];
			return temp;
		}

		private function grp_Tuijian_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_Tuijian = temp;
			temp.name = "grp_Tuijian";
			temp.width = 175;
			temp.x = 22;
			temp.y = 324;
			temp.layout = __FuBenItem_Zhenqi_HorizontalLayout1_i();
			temp.elementsContent = [__FuBenItem_Zhenqi_UIAsset2_i(),numZhanli_i()];
			return temp;
		}

		private function iconFirst_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconFirst = temp;
			temp.name = "iconFirst";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 50;
			temp.y = 28;
			return temp;
		}

		private function icon_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_2 = temp;
			temp.name = "icon_2";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 89;
			temp.y = 205;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "1";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 18;
			temp.x = 104;
			temp.y = 34;
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
			temp.x = 75;
			temp.y = 34;
			return temp;
		}

		private function lbshenyuName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbshenyuName = temp;
			temp.name = "lbshenyuName";
			temp.text = "剩余次数：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 80;
			temp.x = 34;
			temp.y = 34;
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
			temp.height = 15;
			temp.label = "99966";
			temp.styleClass = org.mokylin.skin.app.fuben.uinumber.UINumberFubenzhanli;
			temp.width = 40;
			temp.x = 80;
			temp.y = 0;
			return temp;
		}

		private function resetgroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			resetgroup = temp;
			temp.name = "resetgroup";
			temp.x = 52;
			temp.y = 356;
			temp.elementsContent = [__FuBenItem_Zhenqi_Label1_i(),lbYuanbao_i(),__FuBenItem_Zhenqi_UIAsset3_i(),btnReset_i()];
			return temp;
		}

		private function uiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBg = temp;
			temp.name = "uiBg";
			temp.styleName = "ui/big_bg/fuben/zhenqi/bg1.jpg";
			temp.x = 0;
			return temp;
		}

		private function uiFirst_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFirst = temp;
			temp.name = "uiFirst";
			temp.styleName = "ui/app/fuben/shoutongjiangli.png";
			temp.x = -18;
			temp.y = 2;
			return temp;
		}

		private function uiJiangli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJiangli = temp;
			temp.name = "uiJiangli";
			temp.styleName = "ui/app/fuben/tongguanjiangli.png";
			temp.x = 7;
			temp.y = 182;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/app/fuben/mc/kaiqidengji/kaiqi_50.png";
			temp.x = 51;
			temp.y = 315;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/fuben/mc/zhenqi/50.png";
			temp.x = 53;
			temp.y = 5;
			return temp;
		}

		private function uiTishi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTishi = temp;
			temp.name = "uiTishi";
			temp.styleName = "ui/app/fuben/yitongguan.png";
			temp.width = 70;
			temp.x = 79;
			temp.y = 316;
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
package org.mokylin.skin.app.fuben
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBen_DuoRen_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var _ico_0:feathers.controls.UIAsset;

		public var _ico_1:feathers.controls.UIAsset;

		public var _ico_2:feathers.controls.UIAsset;

		public var _ico_3:feathers.controls.UIAsset;

		public var _ico_4:feathers.controls.UIAsset;

		public var _info_text:feathers.controls.Label;

		public var btnEnter:feathers.controls.Button;

		public var btnExit:feathers.controls.Button;

		public var grpShuoming:feathers.controls.Group;

		public var lbCishu:feathers.controls.Label;

		public var lbDengji:feathers.controls.Label;

		public var lbRenshu:feathers.controls.Label;

		public var lbTiaozhan:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbZhanli:feathers.controls.Label;

		public var scroll_Bar:feathers.controls.ScrollContainer;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBen_DuoRen_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FuBen_DuoRen_Skin_UIAsset2_i(),__FuBen_DuoRen_Skin_UIAsset3_i(),__FuBen_DuoRen_Skin_UIAsset4_i(),grpShuoming_i(),scroll_Bar_i(),lbTiaozhan_i(),_ico_0_i(),_ico_1_i(),_ico_2_i(),_ico_3_i(),_ico_4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBen_DuoRen_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "要求人数：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 17;
			temp.y = 267;
			return temp;
		}

		private function __FuBen_DuoRen_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "要求等级：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 17;
			temp.y = 289;
			return temp;
		}

		private function __FuBen_DuoRen_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "要求战力：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 17;
			temp.y = 310;
			return temp;
		}

		private function __FuBen_DuoRen_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "剩余次数：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 17;
			temp.y = 332;
			return temp;
		}

		private function __FuBen_DuoRen_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 431;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 567;
			temp.x = 19;
			temp.y = 74;
			return temp;
		}

		private function __FuBen_DuoRen_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 431;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 343;
			temp.x = 587;
			temp.y = 74;
			return temp;
		}

		private function __FuBen_DuoRen_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/tiao.jpg";
			temp.x = 19;
			temp.y = 506;
			return temp;
		}

		private function __FuBen_DuoRen_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/rightBg.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FuBen_DuoRen_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/wenzidi1.png";
			temp.x = 82;
			temp.y = 35;
			return temp;
		}

		private function _ico_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			_ico_0 = temp;
			temp.name = "_ico_0";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 247;
			temp.y = 515;
			return temp;
		}

		private function _ico_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			_ico_1 = temp;
			temp.name = "_ico_1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 300;
			temp.y = 515;
			return temp;
		}

		private function _ico_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			_ico_2 = temp;
			temp.name = "_ico_2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 352;
			temp.y = 514;
			return temp;
		}

		private function _ico_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			_ico_3 = temp;
			temp.name = "_ico_3";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 405;
			temp.y = 514;
			return temp;
		}

		private function _ico_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			_ico_4 = temp;
			temp.name = "_ico_4";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 457;
			temp.y = 514;
			return temp;
		}

		private function _info_text_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			_info_text = temp;
			temp.name = "_info_text";
			temp.height = 171;
			temp.htmlText = "1.该副本为跨服副本，可重复进入，单个副本每天前10次通关均可获得通关奖励；<br>2.点击进入匹配按钮后进入匹配队列，匹配到副本开启最少人数后自动开启副本；<br>3.每天通关10次跨服副本后可获取每日挑战奖励。";
			temp.leading = 12;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 292;
			temp.x = 17;
			temp.y = 91;
			return temp;
		}

		private function btnEnter_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnEnter = temp;
			temp.name = "btnEnter";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "进入匹配";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.x = 130;
			temp.y = 374;
			return temp;
		}

		private function btnExit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnExit = temp;
			temp.name = "btnExit";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "退出匹配";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.visible = false;
			temp.x = 130;
			temp.y = 374;
			return temp;
		}

		private function grpShuoming_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpShuoming = temp;
			temp.name = "grpShuoming";
			temp.x = 592;
			temp.y = 79;
			temp.elementsContent = [__FuBen_DuoRen_Skin_UIAsset5_i(),__FuBen_DuoRen_Skin_UIAsset6_i(),uiName_i(),_info_text_i(),__FuBen_DuoRen_Skin_Label1_i(),__FuBen_DuoRen_Skin_Label2_i(),__FuBen_DuoRen_Skin_Label3_i(),__FuBen_DuoRen_Skin_Label4_i(),lbRenshu_i(),lbDengji_i(),lbZhanli_i(),lbCishu_i(),btnEnter_i(),btnExit_i(),lbTime_i()];
			return temp;
		}

		private function lbCishu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCishu = temp;
			temp.name = "lbCishu";
			temp.fontSize = 12;
			temp.text = "2";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 69;
			temp.x = 80;
			temp.y = 332;
			return temp;
		}

		private function lbDengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDengji = temp;
			temp.name = "lbDengji";
			temp.fontSize = 12;
			temp.text = "50";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 69;
			temp.x = 80;
			temp.y = 290;
			return temp;
		}

		private function lbRenshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRenshu = temp;
			temp.name = "lbRenshu";
			temp.fontSize = 12;
			temp.text = "2";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 69;
			temp.x = 80;
			temp.y = 268;
			return temp;
		}

		private function lbTiaozhan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTiaozhan = temp;
			temp.name = "lbTiaozhan";
			temp.text = "每日挑战10次可领取（0/10）：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 201;
			temp.x = 38;
			temp.y = 532;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "00：59";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.visible = false;
			temp.width = 75;
			temp.x = 215;
			temp.y = 380;
			return temp;
		}

		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.fontSize = 12;
			temp.text = "85520";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 69;
			temp.x = 80;
			temp.y = 311;
			return temp;
		}

		private function scroll_Bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroll_Bar = temp;
			temp.name = "scroll_Bar";
			temp.height = 424;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.width = 559;
			temp.x = 24;
			temp.y = 77;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.x = 101;
			temp.y = 29;
			return temp;
		}

	}
}
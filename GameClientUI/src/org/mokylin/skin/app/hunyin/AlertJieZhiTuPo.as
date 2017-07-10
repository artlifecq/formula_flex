package org.mokylin.skin.app.hunyin
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.hunyin.Pro_Hunyin;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertJieZhiTuPo extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var barJindu:feathers.controls.ProgressBar;

		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btn_cancel:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var cboxCailiao:feathers.controls.Check;

		public var grpBar:feathers.controls.Group;

		public var lbCailiao:feathers.controls.Label;

		public var lbDanyao:feathers.controls.Label;

		public var lbJindu:feathers.controls.Label;

		public var lb_xiaohao:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertJieZhiTuPo()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),btnClose_i(),btn_ok_i(),btn_cancel_i(),grpBar_i(),lb_xiaohao_i(),lbDanyao_i(),cboxCailiao_i(),lbCailiao_i(),__AlertJieZhiTuPo_UIAsset2_i(),__AlertJieZhiTuPo_UIAsset3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertJieZhiTuPo_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/pro_bg.png";
			temp.width = 226;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __AlertJieZhiTuPo_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/tupojikejixu.png";
			temp.x = 69;
			temp.y = 70;
			return temp;
		}

		private function __AlertJieZhiTuPo_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/hunyin/hunjietupo.png";
			temp.x = 117;
			temp.y = 5;
			return temp;
		}

		private function barJindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			barJindu = temp;
			temp.name = "barJindu";
			temp.styleClass = org.mokylin.skin.app.hunyin.Pro_Hunyin;
			temp.value = 80;
			temp.x = 20;
			temp.y = 3;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 264;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 326;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 293;
			temp.y = 5;
			return temp;
		}

		private function btn_cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cancel = temp;
			temp.name = "btn_cancel";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "自动进阶";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 181;
			temp.y = 216;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "进 阶";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 57;
			temp.y = 216;
			return temp;
		}

		private function cboxCailiao_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cboxCailiao = temp;
			temp.name = "cboxCailiao";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.labelOffsetY = 3;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0x00FF33;
			temp.width = 111;
			temp.x = 181;
			temp.y = 163;
			return temp;
		}

		private function grpBar_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpBar = temp;
			temp.name = "grpBar";
			temp.x = 52;
			temp.y = 108;
			temp.elementsContent = [__AlertJieZhiTuPo_UIAsset1_i(),barJindu_i(),lbJindu_i()];
			return temp;
		}

		private function lbCailiao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCailiao = temp;
			temp.name = "lbCailiao";
			temp.text = "自动购买材料";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 94;
			temp.x = 206;
			temp.y = 165;
			return temp;
		}

		private function lbDanyao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDanyao = temp;
			temp.name = "lbDanyao";
			temp.text = "婚戒突破丹";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 94;
			temp.x = 72;
			temp.y = 165;
			return temp;
		}

		private function lbJindu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJindu = temp;
			temp.name = "lbJindu";
			temp.text = "800/1000";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 106;
			temp.x = 59;
			temp.y = 3;
			return temp;
		}

		private function lb_xiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_xiaohao = temp;
			temp.name = "lb_xiaohao";
			temp.text = "消耗:";
			temp.x = 36;
			temp.y = 165;
			return temp;
		}

	}
}
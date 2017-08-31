package org.mokylin.skin.app.shangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.shangcheng.button.ButtonBianqiang;
	import org.mokylin.skin.app.shangcheng.button.ButtonCz;
	import org.mokylin.skin.app.shangcheng.button.ButtonLijin;
	import org.mokylin.skin.app.shangcheng.button.ButtonRexiao;
	import org.mokylin.skin.app.shangcheng.button.ButtonVip;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_you;
	import org.mokylin.skin.component.button.ButtonSkin_zuo;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShangCheng_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnBianqiang:feathers.controls.Radio;

		public var btnChongZhi:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnLijin:feathers.controls.Radio;

		public var btnRexiao:feathers.controls.Radio;

		public var btnVip:feathers.controls.Radio;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var grpLijing:feathers.controls.Group;

		public var grpYuanbao:feathers.controls.Group;

		public var lbLijing:feathers.controls.Label;

		public var lbPage:feathers.controls.Label;

		public var lbYuanbao:feathers.controls.Label;

		public var uiLijing:feathers.controls.UIAsset;

		public var uiMeiren:feathers.controls.UIAsset;

		public var uiYuanbao:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShangCheng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 806;
			this.width = 1297;
			this.elementsContent = [bg_i(),lbPage_i(),btn_min_i(),btn_max_i(),grpYuanbao_i(),grpLijing_i(),btnChongZhi_i(),uiMeiren_i(),btnClose_i(),btnRexiao_i(),btnBianqiang_i(),btnLijin_i(),btnVip_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/big_bg/shangcheng/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnBianqiang_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnBianqiang = temp;
			temp.name = "btnBianqiang";
			temp.styleClass = org.mokylin.skin.app.shangcheng.button.ButtonBianqiang;
			temp.x = 1134;
			temp.y = 321;
			return temp;
		}

		private function btnChongZhi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChongZhi = temp;
			temp.name = "btnChongZhi";
			temp.styleClass = org.mokylin.skin.app.shangcheng.button.ButtonCz;
			temp.x = 917;
			temp.y = 670;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 1165;
			temp.y = 161;
			return temp;
		}

		private function btnLijin_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnLijin = temp;
			temp.name = "btnLijin";
			temp.styleClass = org.mokylin.skin.app.shangcheng.button.ButtonLijin;
			temp.x = 1134;
			temp.y = 423;
			return temp;
		}

		private function btnRexiao_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnRexiao = temp;
			temp.name = "btnRexiao";
			temp.styleClass = org.mokylin.skin.app.shangcheng.button.ButtonRexiao;
			temp.x = 1134;
			temp.y = 218;
			return temp;
		}

		private function btnVip_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnVip = temp;
			temp.name = "btnVip";
			temp.styleClass = org.mokylin.skin.app.shangcheng.button.ButtonVip;
			temp.x = 1134;
			temp.y = 527;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_you;
			temp.x = 804;
			temp.y = 690;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zuo;
			temp.x = 690;
			temp.y = 690;
			return temp;
		}

		private function grpLijing_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpLijing = temp;
			temp.name = "grpLijing";
			temp.x = 502;
			temp.y = 700;
			temp.elementsContent = [uiLijing_i(),lbLijing_i()];
			return temp;
		}

		private function grpYuanbao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpYuanbao = temp;
			temp.name = "grpYuanbao";
			temp.x = 502;
			temp.y = 676;
			temp.elementsContent = [uiYuanbao_i(),lbYuanbao_i()];
			return temp;
		}

		private function lbLijing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLijing = temp;
			temp.name = "lbLijing";
			temp.text = "100";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 106;
			temp.x = 32;
			temp.y = 4;
			return temp;
		}

		private function lbPage_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPage = temp;
			temp.name = "lbPage";
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 82;
			temp.x = 717;
			temp.y = 692;
			return temp;
		}

		private function lbYuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbYuanbao = temp;
			temp.name = "lbYuanbao";
			temp.text = "100";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 106;
			temp.x = 32;
			temp.y = 4;
			return temp;
		}

		private function uiLijing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLijing = temp;
			temp.name = "uiLijing";
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiMeiren_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiMeiren = temp;
			temp.name = "uiMeiren";
			temp.styleName = "ui/app/shangcheng/ren.png";
			temp.x = 413;
			temp.y = 377;
			return temp;
		}

		private function uiYuanbao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiYuanbao = temp;
			temp.name = "uiYuanbao";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}
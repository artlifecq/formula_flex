package org.mokylin.skin.app.fuben
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.fuben.button.ButtonLingqu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBenJieSuan_Shibai extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOk:feathers.controls.Button;

		public var dxin1:feathers.controls.UIAsset;

		public var dxin2:feathers.controls.UIAsset;

		public var dxin3:feathers.controls.UIAsset;

		public var grp_dixin:feathers.controls.Group;

		public var grp_xin:feathers.controls.Group;

		public var lbJingyan:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbTongqian:feathers.controls.Label;

		public var xin1:feathers.controls.UIAsset;

		public var xin2:feathers.controls.UIAsset;

		public var xin3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBenJieSuan_Shibai()
		{
			super();
			
			this.currentState = "normal";
			this.height = 613;
			this.width = 425;
			this.elementsContent = [__FuBenJieSuan_Shibai_UIAsset1_i(),grp_dixin_i(),grp_xin_i(),__FuBenJieSuan_Shibai_Label1_i(),__FuBenJieSuan_Shibai_Label2_i(),lbJingyan_i(),lbTongqian_i(),btnOk_i(),lbTime_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBenJieSuan_Shibai_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "获得经验：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 137;
			temp.y = 293;
			return temp;
		}

		private function __FuBenJieSuan_Shibai_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "获得铜钱：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 137;
			temp.y = 325;
			return temp;
		}

		private function __FuBenJieSuan_Shibai_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/fuben/fubenjiesuan/shibai.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.styleClass = org.mokylin.skin.app.fuben.button.ButtonLingqu;
			temp.x = 115;
			temp.y = 434;
			return temp;
		}

		private function dxin1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dxin1 = temp;
			temp.name = "dxin1";
			temp.styleName = "ui/app/fuben/fubenjiesuan/xin2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function dxin2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dxin2 = temp;
			temp.name = "dxin2";
			temp.styleName = "ui/app/fuben/fubenjiesuan/xin2.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function dxin3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dxin3 = temp;
			temp.name = "dxin3";
			temp.styleName = "ui/app/fuben/fubenjiesuan/xin2.png";
			temp.x = 144;
			temp.y = 0;
			return temp;
		}

		private function grp_dixin_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_dixin = temp;
			temp.name = "grp_dixin";
			temp.x = 103;
			temp.y = 210;
			temp.elementsContent = [dxin1_i(),dxin2_i(),dxin3_i()];
			return temp;
		}

		private function grp_xin_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xin = temp;
			temp.name = "grp_xin";
			temp.x = 103;
			temp.y = 210;
			temp.elementsContent = [xin1_i(),xin2_i(),xin3_i()];
			return temp;
		}

		private function lbJingyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJingyan = temp;
			temp.name = "lbJingyan";
			temp.text = "7800000";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 216;
			temp.y = 293;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "10秒自动领取奖励";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 134;
			temp.y = 497;
			return temp;
		}

		private function lbTongqian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTongqian = temp;
			temp.name = "lbTongqian";
			temp.text = "7800000";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 121;
			temp.x = 216;
			temp.y = 325;
			return temp;
		}

		private function xin1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xin1 = temp;
			temp.name = "xin1";
			temp.styleName = "ui/app/fuben/fubenjiesuan/xin1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function xin2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xin2 = temp;
			temp.name = "xin2";
			temp.styleName = "ui/app/fuben/fubenjiesuan/xin1.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function xin3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xin3 = temp;
			temp.name = "xin3";
			temp.styleName = "ui/app/fuben/fubenjiesuan/xin1.png";
			temp.x = 144;
			temp.y = 0;
			return temp;
		}

	}
}
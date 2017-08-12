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
	public class FuBenJieSuan_Shengli extends feathers.controls.StateSkin
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

		public var lbzhenqi:feathers.controls.Label;

		public var xin1:feathers.controls.UIAsset;

		public var xin2:feathers.controls.UIAsset;

		public var xin3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBenJieSuan_Shengli()
		{
			super();
			
			this.currentState = "normal";
			this.height = 612;
			this.width = 436;
			this.elementsContent = [__FuBenJieSuan_Shengli_UIAsset1_i(),__FuBenJieSuan_Shengli_UIAsset2_i(),__FuBenJieSuan_Shengli_UIAsset3_i(),grp_dixin_i(),grp_xin_i(),__FuBenJieSuan_Shengli_Label1_i(),__FuBenJieSuan_Shengli_Label2_i(),lbJingyan_i(),lbTongqian_i(),__FuBenJieSuan_Shengli_Label3_i(),lbzhenqi_i(),btnOk_i(),lbTime_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBenJieSuan_Shengli_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "获得经验：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 142;
			temp.y = 249;
			return temp;
		}

		private function __FuBenJieSuan_Shengli_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "获得铜钱：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 142;
			temp.y = 270;
			return temp;
		}

		private function __FuBenJieSuan_Shengli_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "获得真气：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 142;
			temp.y = 290;
			return temp;
		}

		private function __FuBenJieSuan_Shengli_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/fuben/fubenjiesuan/shengli.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FuBenJieSuan_Shengli_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/fubenjiesuan/di.png";
			temp.x = 106;
			temp.y = 317;
			return temp;
		}

		private function __FuBenJieSuan_Shengli_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/fubenjiesuan/huodejiangli.png";
			temp.x = 168;
			temp.y = 323;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.styleClass = org.mokylin.skin.app.fuben.button.ButtonLingqu;
			temp.x = 120;
			temp.y = 445;
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
			temp.x = 108;
			temp.y = 188;
			temp.elementsContent = [dxin1_i(),dxin2_i(),dxin3_i()];
			return temp;
		}

		private function grp_xin_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xin = temp;
			temp.name = "grp_xin";
			temp.x = 108;
			temp.y = 188;
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
			temp.width = 119;
			temp.x = 221;
			temp.y = 249;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "10秒自动领取奖励";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 139;
			temp.y = 508;
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
			temp.width = 119;
			temp.x = 221;
			temp.y = 270;
			return temp;
		}

		private function lbzhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbzhenqi = temp;
			temp.name = "lbzhenqi";
			temp.text = "7800000";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 221;
			temp.y = 290;
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
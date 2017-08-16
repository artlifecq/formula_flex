package org.mokylin.skin.app.mail
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Mail_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var chkSelect:feathers.controls.Check;

		public var imgOver:feathers.controls.UIAsset;

		public var imgSelect:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var uiBg:feathers.controls.UIAsset;

		public var uiCurrent:feathers.controls.UIAsset;

		public var uiDian:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Mail_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 51;
			this.width = 373;
			this.elementsContent = [uiBg_i(),uiCurrent_i(),uiDian_i(),lbName_i(),lbTime_i(),imgOver_i(),imgSelect_i(),chkSelect_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function chkSelect_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkSelect = temp;
			temp.name = "chkSelect";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 16;
			temp.y = 14;
			return temp;
		}

		private function imgOver_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgOver = temp;
			temp.name = "imgOver";
			temp.height = 51;
			temp.styleName = "ui/common/hover/xuanqukuang2.png";
			temp.width = 373;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSelect = temp;
			temp.name = "imgSelect";
			temp.height = 51;
			temp.styleName = "ui/common/hover/xuanqukuang2.png";
			temp.width = 373;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.letterSpacing = 0;
			temp.text = "手机验证奖励";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 91;
			temp.y = 17;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.letterSpacing = -1;
			temp.text = "剩余时间：29天";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 103;
			temp.x = 255;
			temp.y = 16;
			return temp;
		}

		private function uiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBg = temp;
			temp.name = "uiBg";
			temp.styleName = "ui/app/mail/youjiantiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiCurrent_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCurrent = temp;
			temp.name = "uiCurrent";
			temp.styleName = "ui/app/mail/yj_youneirong.png";
			temp.x = 47;
			temp.y = 9;
			return temp;
		}

		private function uiDian_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDian = temp;
			temp.name = "uiDian";
			temp.styleName = "ui/app/mail/tixingdiandian.png";
			temp.x = 76;
			temp.y = 33;
			return temp;
		}

	}
}
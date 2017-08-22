package org.mokylin.skin.app.jianghu.lunjian
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.jianghu.lunjian.NameItemSelect;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class LunJian_NameItem extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbLevel:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var numBg:feathers.controls.UIAsset;

		public var selectedBtn:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LunJian_NameItem()
		{
			super();
			
			this.currentState = "normal";
			this.height = 31;
			this.width = 145;
			this.elementsContent = [__LunJian_NameItem_UIAsset1_i(),selectedBtn_i(),lbName_i(),lbLevel_i(),numBg_i(),lbNum_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __LunJian_NameItem_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jianghu/lunjian/tiaoan.png";
			temp.width = 145;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "(41级)";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 78;
			temp.y = 7;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "新手村村村";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 99;
			temp.x = 8;
			temp.y = 7;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "12";
			temp.textAlign = "center";
			temp.color = 0xEFD872;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 20;
			temp.x = 123;
			temp.y = 7;
			return temp;
		}

		private function numBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			numBg = temp;
			temp.name = "numBg";
			temp.styleName = "ui/common/tubiao/szq.png";
			temp.x = 122;
			temp.y = 5;
			return temp;
		}

		private function selectedBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			selectedBtn = temp;
			temp.name = "selectedBtn";
			temp.groupName = "radioGroup1";
			temp.height = 31;
			temp.styleClass = org.mokylin.skin.app.jianghu.lunjian.NameItemSelect;
			temp.width = 145;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}
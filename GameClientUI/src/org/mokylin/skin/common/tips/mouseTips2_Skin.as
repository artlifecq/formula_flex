package org.mokylin.skin.common.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class mouseTips2_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbl_name:feathers.controls.Label;

		public var lbl_name0:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function mouseTips2_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 37;
			this.width = 273;
			this.elementsContent = [__mouseTips2_Skin_UIAsset1_i(),lbl_name_i(),lbl_name0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __mouseTips2_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.top = 0;
			return temp;
		}

		private function lbl_name0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name0 = temp;
			temp.name = "lbl_name0";
			temp.height = 24;
			temp.htmlText = "99999/100000<font color='#5DBD37'>(75%)</font>";
			temp.text = "文本";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 176;
			temp.x = 87;
			temp.y = 6;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.height = 24;
			temp.text = "当前经验：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 10;
			temp.y = 6;
			return temp;
		}

	}
}
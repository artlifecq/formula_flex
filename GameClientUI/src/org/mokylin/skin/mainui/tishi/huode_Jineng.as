package org.mokylin.skin.mainui.tishi
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
	public class huode_Jineng extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbl_time:feathers.controls.Label;

		public var lbl_zhuangbei:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function huode_Jineng()
		{
			super();
			
			this.currentState = "normal";
			this.height = 102;
			this.width = 331;
			this.elementsContent = [__huode_Jineng_UIAsset1_i(),__huode_Jineng_UIAsset2_i(),__huode_Jineng_UIAsset3_i(),lbl_zhuangbei_i(),lbl_time_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __huode_Jineng_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 102;
			temp.styleName = "ui/mainui/tishi/kuangzi.png";
			temp.width = 331;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __huode_Jineng_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/64.png";
			temp.x = 21;
			temp.y = 13;
			return temp;
		}

		private function __huode_Jineng_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/tishi/gxnhdxjn.png";
			temp.x = 106;
			temp.y = 13;
			return temp;
		}

		private function lbl_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_time = temp;
			temp.name = "lbl_time";
			temp.text = "1s秒后自动关闭";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 151;
			temp.y = 69;
			return temp;
		}

		private function lbl_zhuangbei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_zhuangbei = temp;
			temp.name = "lbl_zhuangbei";
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "装备名称";
			temp.color = 0xF9E7B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.x = 171;
			temp.y = 41;
			return temp;
		}

	}
}
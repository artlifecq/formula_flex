package org.mokylin.skin.app.zuoqi
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
	public class Tips_Zhufuzhi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lab_num:feathers.controls.Label;

		public var lab_time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_Zhufuzhi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 249;
			this.width = 280;
			this.elementsContent = [__Tips_Zhufuzhi_UIAsset1_i(),__Tips_Zhufuzhi_Label1_i(),lab_num_i(),__Tips_Zhufuzhi_Label2_i(),lab_time_i(),__Tips_Zhufuzhi_UIAsset2_i(),__Tips_Zhufuzhi_Label3_i(),__Tips_Zhufuzhi_Label4_i(),__Tips_Zhufuzhi_Label5_i(),__Tips_Zhufuzhi_Label6_i(),__Tips_Zhufuzhi_Label7_i(),__Tips_Zhufuzhi_Label8_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_Zhufuzhi_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.letterSpacing = 1;
			temp.fontSize = 16;
			temp.text = "当前祝福值：";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 11;
			temp.y = 11;
			return temp;
		}

		private function __Tips_Zhufuzhi_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 0;
			temp.text = "祝福值清空时间：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 12;
			temp.y = 38;
			return temp;
		}

		private function __Tips_Zhufuzhi_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 1;
			temp.text = "祝福值可以增加人物临时属性";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 11;
			temp.y = 77;
			return temp;
		}

		private function __Tips_Zhufuzhi_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 1;
			temp.text = "祝福值清零时，临时属性也将消失";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 11;
			temp.y = 95;
			return temp;
		}

		private function __Tips_Zhufuzhi_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "什么是祝福值：";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 11;
			temp.y = 121;
			return temp;
		}

		private function __Tips_Zhufuzhi_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 45;
			temp.leading = 5;
			temp.letterSpacing = 0;
			temp.text = "进阶失败后获得祝福值，祝福值越高成功几率越大";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 259;
			temp.x = 11;
			temp.y = 139;
			return temp;
		}

		private function __Tips_Zhufuzhi_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "祝福值清空时间：";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 11;
			temp.y = 183;
			return temp;
		}

		private function __Tips_Zhufuzhi_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 45;
			temp.leading = 5;
			temp.letterSpacing = 0;
			temp.text = "每日0点祝福值将被清空，一次性完成进阶可避免祝福值损失";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 264;
			temp.x = 11;
			temp.y = 201;
			return temp;
		}

		private function __Tips_Zhufuzhi_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 249;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Tips_Zhufuzhi_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 7;
			temp.y = 65;
			return temp;
		}

		private function lab_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_num = temp;
			temp.name = "lab_num";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "100";
			temp.color = 0x9D4AA8;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 70;
			temp.x = 117;
			temp.y = 12;
			return temp;
		}

		private function lab_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_time = temp;
			temp.name = "lab_time";
			temp.text = "不限时";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 90;
			temp.x = 122;
			temp.y = 38;
			return temp;
		}

	}
}
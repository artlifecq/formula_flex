package org.mokylin.skin.component.radio
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RadioButtonSkin extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RadioButtonSkin()
		{
			super();
			
			this.currentState = "up";
			this.height = 21;
			this.width = 195;
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xFDFDFD
						}
					]
			};
			skinNames={"down":"ui/component/radio/skin_1/normal_down.png",
			"downAndSelected":"ui/component/radio/skin_1/select_down.png",
			"hover":"ui/component/radio/skin_1/normal_over.png",
			"overAndSelected":"ui/component/radio/skin_1/select_over.png",
			"up":"ui/component/radio/skin_1/normal_up.png",
			"upAndSelected":"ui/component/radio/skin_1/select_up.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.left = 18;
			temp.right = 0;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xFDFDFD;
			temp.y = -1;
			return temp;
		}

	}
}
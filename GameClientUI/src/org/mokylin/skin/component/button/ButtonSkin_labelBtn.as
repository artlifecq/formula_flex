package org.mokylin.skin.component.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_labelBtn extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_labelBtn()
		{
			super();
			
			this.currentState = "down";
			this.width = 74;
			this.elementsContent = [labelDisplay_i()];
			
			states = {
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x927070
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xCA0707
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0xFDF8F8
						}
						,
						{target:"labelDisplay",
							name:"left",
							value:0
						}
						,
						{target:"labelDisplay",
							name:"right",
							value:0
						}
					]
			};
			skinNames={};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.left = 0;
			temp.right = 0;
			temp.text = "标签";
			temp.textAlign = "center";
			return temp;
		}

	}
}
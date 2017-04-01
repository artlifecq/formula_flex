package org.mokylin.skin.signIn
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CheckBoxSkin extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CheckBoxSkin()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.height = 23;
			this.width = 100;
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"fontSize",
							value:12
						}
						,
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xf9f0cc
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/signIn/check/down.png",
			"downAndSelected":"ui/signIn/check/downAndSelected.png",
			"hover":"ui/signIn/check/over.png",
			"overAndSelected":"ui/signIn/check/overAndSelected.png",
			"up":"ui/signIn/check/up.png",
			"upAndSelected":"ui/signIn/check/upAndSelected.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 20;
			temp.right = 0;
			temp.fontSize = 12;
			temp.text = "12313";
			temp.textAlign = "center";
			temp.color = 0xf9f0cc;
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}
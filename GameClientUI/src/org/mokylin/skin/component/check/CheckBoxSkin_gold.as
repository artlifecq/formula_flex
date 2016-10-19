package org.mokylin.skin.component.check
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CheckBoxSkin_gold extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CheckBoxSkin_gold()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.height = 20;
			this.width = 176;
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"color",
							value:0xC9B48A
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/component/check/skin_gold/down.png",
			"downAndSelected":"ui/component/check/skin_gold/downAndselected.png",
			"hover":"ui/component/check/skin_gold/over.png",
			"overAndSelected":"ui/component/check/skin_gold/overAndselected.png",
			"up":"ui/component/check/skin_gold/up.png",
			"upAndSelected":"ui/component/check/skin_gold/upAndselected.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 20;
			temp.left = 20;
			temp.text = "这是一个复选框";
			temp.color = 0xC9B48A;
			temp.top = 0;
			temp.verticalAlign = "middle";
			temp.width = 150;
			return temp;
		}

	}
}
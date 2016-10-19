package org.mokylin.skin.component.check
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CheckSkin_1 extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CheckSkin_1()
		{
			super();
			
			this.currentState = "up";
			this.height = 17;
			this.width = 83;
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"color",
							value:0xE6DFCB
						}
					]
			};
			skinNames={"down":"ui/component/check/skin_1/normal_down.png",
			"downAndSelected":"ui/component/check/skin_1/select_down.png",
			"hover":"ui/component/check/skin_1/normal_over.png",
			"overAndSelected":"ui/component/check/skin_1/select_over.png",
			"up":"ui/component/check/skin_1/normal_up.png",
			"upAndSelected":"ui/component/check/skin_1/select_up.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.left = 16;
			temp.right = 2;
			temp.text = "标签";
			temp.color = 0xE6DFCB;
			temp.y = 0;
			return temp;
		}

	}
}
package org.mokylin.skin.mainui.navigation
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
	public class nv_erjibtn_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function nv_erjibtn_Skin()
		{
			super();
			
			this.currentState = "down";
			this.width = 51;
			this.elementsContent = [labelDisplay_i(),iconDisplay_i()];
			
			states = {
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xdfcaad
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0x908371
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.textAlign = "center";
			temp.color = 0x908371;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.top = 0;
			temp.verticalAlign = "middle";
			temp.width = 41;
			temp.x = 10;
			return temp;
		}

	}
}
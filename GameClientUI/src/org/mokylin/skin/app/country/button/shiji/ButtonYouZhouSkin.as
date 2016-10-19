package org.mokylin.skin.app.country.button.shiji
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonYouZhouSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var hoverBg:feathers.controls.UIAsset;

		public var hoverItem:feathers.controls.UIAsset;

		public var normalBg:feathers.controls.UIAsset;

		public var normalItem:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonYouZhouSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 35;
			this.width = 210;
			this.elementsContent = [hoverBg_i(),hoverItem_i(),normalBg_i(),normalItem_i()];
			
			states = {
				normal:[
						{target:"hoverBg",
							name:"visible",
							value:false
						}
						,
						{target:"hoverItem",
							name:"visible",
							value:false
						}
					]
				,
				select:[
						{target:"normalBg",
							name:"visible",
							value:false
						}
						,
						{target:"normalItem",
							name:"visible",
							value:false
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function hoverBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			hoverBg = temp;
			temp.name = "hoverBg";
			temp.height = 35;
			temp.styleName = "ui/app/country/shiji/liebiao/down.png";
			temp.width = 210;
			temp.y = 0;
			return temp;
		}

		private function hoverItem_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			hoverItem = temp;
			temp.name = "hoverItem";
			temp.height = 22;
			temp.styleName = "ui/app/country/shiji/youzhou/down.png";
			temp.width = 40;
			temp.x = 40;
			temp.y = 6;
			return temp;
		}

		private function normalBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			normalBg = temp;
			temp.name = "normalBg";
			temp.height = 35;
			temp.styleName = "ui/app/country/shiji/liebiao/up.png";
			temp.width = 210;
			return temp;
		}

		private function normalItem_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			normalItem = temp;
			temp.name = "normalItem";
			temp.height = 22;
			temp.styleName = "ui/app/country/shiji/youzhou/up.png";
			temp.width = 40;
			temp.x = 40;
			temp.y = 6;
			return temp;
		}

	}
}
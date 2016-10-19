package org.mokylin.skin.app.countryWar
{
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.progress.ProgressBarSKin_hp1Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarBottomBarFinalHeadRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imageFrame:feathers.controls.UIAsset;

		public var imageTextName:feathers.controls.UIAsset;

		public var imageTextStatus:feathers.controls.UIAsset;

		public var pbHp:feathers.controls.ProgressBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarBottomBarFinalHeadRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imageFrame_i(),imageTextName_i(),pbHp_i(),imageTextStatus_i()];
			
			states = {
				init:[
						{target:"pbHp",
							name:"paddingLeft",
							value:1
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imageFrame_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageFrame = temp;
			temp.name = "imageFrame";
			temp.styleName = "ui/app/countryWar/shen_shou_di_2.png";
			temp.x = -62;
			temp.y = -51;
			return temp;
		}

		private function imageTextName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageTextName = temp;
			temp.name = "imageTextName";
			temp.styleName = "ui/app/countryWar/text_shen_shou_2.png";
			temp.x = -26;
			temp.y = -34;
			return temp;
		}

		private function imageTextStatus_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageTextStatus = temp;
			temp.name = "imageTextStatus";
			temp.styleName = "ui/app/countryWar/text_bu_ke_gong.png";
			temp.x = -60;
			temp.y = -110;
			return temp;
		}

		private function pbHp_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pbHp = temp;
			temp.name = "pbHp";
			temp.height = 6;
			temp.paddingRight = 1;
			temp.styleClass = org.mokylin.skin.component.progress.ProgressBarSKin_hp1Skin;
			temp.width = 69;
			temp.x = -31;
			temp.y = -125;
			return temp;
		}

	}
}
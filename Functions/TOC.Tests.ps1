$here = Split-Path -Path $MyInvocation.MyCommand.Path -Parent;
$moduleRoot = Split-Path -Path $here -Parent;
Import-Module "$moduleRoot\PScribo.psm1" -Force;

InModuleScope 'PScribo' {

    Describe 'TOC' {
        $pscriboDocument = Document 'ScaffoldDocument' {};

        Context 'By Named Parameter' {

            It 'returns a PSCustomObject object.' {
                $t = TOC -Name Test;
                $t.GetType().Name | Should Be 'PSCustomObject';
                $t.Type | Should Be 'PScribo.TOC';
            }

            It 'creates a TOC by named -Name parameter.' {
                $text = 'Simple paragraph.';
                $t = TOC -Name $text;
                $t.Name | Should Be $text;
            }

            It 'creates a TOC by named -Name parameter with enabled -ForceUppercaseSection option.' {
                $pscriboDocument.Options['ForceUppercaseSection'] = $true;
                $text = 'Simple paragraph.';
                $t = TOC -Name $text;
                $t.Name | Should Be $text.ToUpper();
            }
    
        } #end context By Named Parameter
    
        Context 'By Positional Parameter' {
        
            It 'creates a TOC by named -Name parameter.' {
                $text = 'Simple paragraph.';
                $t = TOC $text;
                $t.Name | Should Be $text;
            }

            It 'creates a TOC by named -Name parameter with enabled -ForceUppercaseSection option.' {
                $pscriboDocument.Options['ForceUppercaseSection'] = $true;
                $text = 'Simple paragraph.';
                $t = TOC $text;
                $t.Name | Should Be $text.ToUpper();
            }
        } #end content By Positional Parameter

    } #end describe TOC

} #end inmodulescope

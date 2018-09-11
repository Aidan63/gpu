package;

import tink.Cli;

class Main
{
    public static function main()
    {
        Cli.process(Sys.args(), new Main()).handle(Cli.exit);
    }

    public function new()
    {
        json         = '';
        compress     = false;
        ignoreHidden = false;
        verbose      = false;
        output       = 'output.parcel';
    }

    @:flag('-from-json')
    public var json : String;

    @:flag('-output')
    public var output : String;

    @:flag('--compress')
    public var compress : Bool;

    @:flag('--ignore-hidden')
    public var ignoreHidden : Bool;

    @:flag('--verbose')
    public var verbose : Bool;

    @:defaultCommand
    public function create()
    {
        if (json != '')
        {
            ParcelTool.createFromJson(json, output, compress, verbose);
        }
    }
}
